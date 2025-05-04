//
//  Endpoint.swift
//  clean-arquitecture-movie-db
//
//  Created by Julian González on 4/05/25.
//

import Foundation

enum HTTMethod: String {
    case get = "GET"
    case post = "POST"
}

enum Endpoint {
    case popularShows
    case tvshowDetails(id: Int)
    
    var url: URL {
        let baseUrl = "https://api.themoviedb.org/3"
        let apiKey = "0b81ca3d23e471885bb1fee6559c2771"
        
        switch self {
            case .popularShows:
                return URL(string: "\(baseUrl)/tv/popular?api_key=\(apiKey)&language=es_ES&page=1")!
            case .tvshowDetails(let id):
                return URL(string: "\(baseUrl)/tv/\(id)?api_key=\(apiKey)&language=es_ES")!
        }
    }
    
    var method: HTTMethod {
        return .get
    }
}
