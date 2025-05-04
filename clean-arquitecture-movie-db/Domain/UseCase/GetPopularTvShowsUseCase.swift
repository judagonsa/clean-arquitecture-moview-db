//
//  GetPopularTvShowsUseCase.swift
//  clean-arquitecture-movie-db
//
//  Created by Julian González on 4/05/25.
//

protocol GetPopularTvShowsUseCaseProtocol {
    func execute() async throws -> [TvShow]
}

final class GetPopularTvShowsUseCase: GetPopularTvShowsUseCaseProtocol {
    private let repository: TvShowRepository
    
    init(repository: TvShowRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [TvShow] {
        try await repository.fetchPopularTVShows()
    }
}
