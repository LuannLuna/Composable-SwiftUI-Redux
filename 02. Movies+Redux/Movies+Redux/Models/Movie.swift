//
//  Movie.swift
//  Movies+Redux
//
//  Created by Luann Luna on 04/05/22.
//

import Foundation

struct MovieResponse: Codable {
    let movies: [Movie]
    let totalResults, response: String

    enum CodingKeys: String, CodingKey {
        case movies = "Search"
        case totalResults
        case response = "Response"
    }
}

struct Movie: Codable {
    let title, year, imdbID: String
    let type: TitleType
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

enum TitleType: String, Codable {
    case movie = "movie"
    case series = "series"
}
