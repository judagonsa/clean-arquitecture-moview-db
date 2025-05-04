//
//  TvShowDetails.swift
//  clean-arquitecture-movie-db
//
//  Created by Julian González on 3/05/25.
//


import Foundation

struct TvShowDetail: Codable {
    let name: String
    let genres: [Genres]
    let overview: String
}

struct Genres: Codable, Identifiable {
    let id: Int
    let name: String
}
