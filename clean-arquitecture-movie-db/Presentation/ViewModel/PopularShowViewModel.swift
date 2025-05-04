//
//  PopularShowViewModel.swift
//  clean-arquitecture-movie-db
//
//  Created by Julian González on 4/05/25.
//

import SwiftUI

class PopularShowViewModel: ObservableObject {
    @Published var shows: [TvShow] = []
    
    private let getPopularTvShowUseCase: GetPopularTvShowsUseCaseProtocol
    
    init(
        getPopularTvShowUseCase: GetPopularTvShowsUseCaseProtocol = GetPopularTvShowsUseCase()) {
        self.getPopularTvShowUseCase = getPopularTvShowUseCase
    }
    
    func loadPopularShow() {
        Task {
            do {
                let shows = try await getPopularTvShowUseCase.execute()
                await MainActor.run {
                    self.shows = shows
                }
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
