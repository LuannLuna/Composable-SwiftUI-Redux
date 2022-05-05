//
//  Actions.swift
//  RestRoomFinder
//
//  Created by Luann Luna on 05/05/22.
//

import Foundation

protocol Action { }

struct FetchRestroomsAction: Action {
    let latitude: Double
    let longitude: Double
}

struct SetRestroomsAction: Action {
    let restrooms: [Restroom]
}
