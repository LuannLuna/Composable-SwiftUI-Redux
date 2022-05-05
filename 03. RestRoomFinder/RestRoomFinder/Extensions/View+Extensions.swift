//
//  View+Extensions.swift
//  RestRoomFinder
//
//  Created by Luann Luna on 05/05/22.
//

import Foundation
import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
