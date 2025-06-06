//
//  TvShow.swift
//  clean-arquitecture-movie-db
//
//  Created by Julian González on 3/05/25.
//


import Foundation

//Codable, JSON

struct TvShowPopularResponse: Codable {
    let results: [TvShow]
}

struct TvShow: Codable {
    let id: Int
    let name: String
    let first_air_date: String
    let vote_average: Double
}
