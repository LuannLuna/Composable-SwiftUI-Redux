//
//  Constants.swift
//  RestRoomFinder
//
//  Created by Luann Luna on 05/05/22.
//

import Foundation

struct Constants {
    struct Urls {
        static func restroomByLatAndLng(lat: Double, lng: Double) -> String {
            "https://refugerestrooms.org/api/v1/restrooms/by_location?page=1&per_page=10&offset=0&lat=\(lat)&lng=\(lng)"
        }
    }
}
