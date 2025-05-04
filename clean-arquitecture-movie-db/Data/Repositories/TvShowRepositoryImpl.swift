//
//  TvShowRepositoryImpl.swift
//  clean-arquitecture-movie-db
//
//  Created by Julian González on 4/05/25.
//

class TvShowRepositoryImpl: TvShowRepository {
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }
    
    func fetchPopularTVShows() async throws -> [TvShow] {
        let response: TvShowPopularResponse = try await apiClient.request(endpoint: .popularShows)
        return response.results
    }

    func fetchTvShowDetails(id: Int) async throws -> TvShowDetail {
        try await apiClient.request(endpoint: .tvShowDetails(id: id))
    }
}
