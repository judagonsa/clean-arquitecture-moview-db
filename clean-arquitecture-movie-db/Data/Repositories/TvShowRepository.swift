//
//  TvShowRepository.swift
//  clean-arquitecture-movie-db
//
//  Created by Julian González on 4/05/25.
//

protocol TvShowRepository {
    func fetchPopularTVShows() async throws -> [TvShow]
    func fetchTvShowDetails(id: Int) async throws -> TvShowDetail
}
