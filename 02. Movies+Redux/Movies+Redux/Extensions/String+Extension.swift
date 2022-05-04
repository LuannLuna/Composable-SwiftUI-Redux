//
//  String+Extension.swift
//  Movies+Redux
//
//  Created by Luann Luna on 04/05/22.
//

import Foundation

extension String {
    var urlEncode: String {
        self.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? self
    }
    
    var asInt: Int {
        let ratingDouble = Double(self) ?? 0.0
        return Int(ratingDouble.rounded())
    }
}
