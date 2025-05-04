//
//  GetTvShowDetailUseCase.swift
//  clean-arquitecture-movie-db
//
//  Created by Julian González on 4/05/25.
//

protocol GetTvShowDetailUseCaseProtocol {
    func execute(id: Int) async throws -> TvShowDetail
}

final class GetTvShowDetailUseCase: GetTvShowDetailUseCaseProtocol {
    private let repository: TvShowRepository
    
    init(repository: TvShowRepository = TvShowRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(id: Int) async throws -> TvShowDetail {
        try await repository.fetchTvShowDetails(id: id)
    }
}
 
