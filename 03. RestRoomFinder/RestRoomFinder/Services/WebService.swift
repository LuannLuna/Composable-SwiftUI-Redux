//
//  WebService.swift
//  RestRoomFinder
//
//  Created by Luann Luna on 05/05/22.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case decodingError
    case noData
}

class WebService {
    func getRestroomsByLatAndLng(lat: Double, lng: Double, completion: @escaping (Result<[Restroom]?, NetworkError>) -> Void) {
        guard let resouceUrl = URL(string: Constants.Urls.restroomByLatAndLng(lat: lat, lng: lng)) else {
            return completion(.failure(.badUrl))
        }
        
        URLSession.shared.dataTask(with: resouceUrl) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            guard let restrooms = try? JSONDecoder().decode([Restroom].self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            return completion(.success(restrooms))
        }.resume()
    }
}
