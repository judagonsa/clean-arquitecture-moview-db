//
//  TvShowDetails.swift
//  clean-arquitecture-movie-db
//
//  Created by Julian González on 3/05/25.
//


import Foundation

struct TvShowDetail: Codable {
    let name: String
    let overview: String
    let gender: [Gender]
    let posterPath: String?
    let backdropPath: String?
}

struct Gender: Codable {
    let name: String
}
