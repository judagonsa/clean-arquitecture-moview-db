//
//  DetailTvShowViewModel.swift
//  clean-arquitecture-movie-db
//
//  Created by Julian González on 4/05/25.
//

import SwiftUI
class DetailTvShowViewModel: ObservableObject {
    @Published var details: TvShowDetail?
    
    var showId: Int = 0
    
    private let getTvShowDetailUseCase: GetTvShowDetailUseCaseProtocol
    
    init(id: Int, getTvShowDetailUseCase: GetTvShowDetailUseCaseProtocol = GetTvShowDetailUseCase()) {
        self.showId = id
        self.getTvShowDetailUseCase = getTvShowDetailUseCase
    }
    
    func loadDetail(id: Int) async {
        Task {
            do {
                let details = try await getTvShowDetailUseCase.execute(id: id)
                
                await MainActor.run {
                    self.details = details
                }
                
            } catch {
                print("Error \(error)")
            }
            
        }
    }
}
 
