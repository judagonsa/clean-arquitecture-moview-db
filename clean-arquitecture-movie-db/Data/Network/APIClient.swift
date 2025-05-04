    //
    //  APIClient.swift
    //  clean-arquitecture-movie-db
    //
    //  Created by Julian González on 4/05/25.
    //


import Foundation

class APIClient {
    func request<T: Decodable>(endpoint: Endpoint) async throws -> T {
        var urlRequest = URLRequest(url: endpoint.url)
        urlRequest.httpMethod = endpoint.method.rawValue
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpRepsonse = response as? HTTPURLResponse, (200...299).contains(httpRepsonse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        
        return try decoder.decode(T.self, from: data)
    }
}
