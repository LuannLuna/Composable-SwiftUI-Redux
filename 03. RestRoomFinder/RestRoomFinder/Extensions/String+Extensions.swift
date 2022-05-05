//
//  String+Extensions.swift
//  RestRoomFinder
//
//  Created by Luann Luna on 05/05/22.
//

import Foundation

extension String {
    var urlEncode: String? {
        self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }
}
