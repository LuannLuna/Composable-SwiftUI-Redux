//
//  URL+Extension.swift
//  Movies+Redux
//
//  Created by Luann Luna on 04/05/22.
//

import Foundation

extension URL {
    
    static func forMovieByImdbId(imdbId: String) -> URL? {
        return URL(string: "https://www.omdbapi.com/?i=\(imdbId)&apikey=\(Constants.API_KEY)")
    }
    
    static func forMoviesByName(_ name: String) -> URL? {
        return URL(string: "https://www.omdbapi.com/?s=\(name)&apikey=\(Constants.API_KEY)")
    }
}
