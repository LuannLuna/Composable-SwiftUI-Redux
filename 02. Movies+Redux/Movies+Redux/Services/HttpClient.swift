//
//  HttpClient.swift
//  Movies+Redux
//
//  Created by Luann Luna on 04/05/22.
//

import Foundation

enum NetworkError: Error {
    case  badUrl
    case noData
    case decodingError
}

class HTTPClient {
    
    func getMovieDetailsBy(imdbId: String, completion: @escaping (Result<MovieDetail, NetworkError>) -> Void) {
        guard let url = URL.forMovieByImdbId(imdbId: imdbId) else {
            return completion(.failure(.badUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let movieResponse = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            completion(.success(movieResponse))
        }.resume()
    }
    
    func getMoviesBy(search: String, completion: @escaping (Result<[Movie]?, NetworkError>) -> Void) {
        
        guard let url = URL.forMoviesByName(search) else {
            return completion(.failure(.badUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let moviesResponse = try? JSONDecoder().decode(MovieResponse.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            completion(.success(moviesResponse.movies))
        }.resume()
    }
}
