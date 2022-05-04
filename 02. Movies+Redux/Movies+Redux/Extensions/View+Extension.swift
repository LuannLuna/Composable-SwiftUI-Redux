//
//  View+Extension.swift
//  Movies+Redux
//
//  Created by Luann Luna on 04/05/22.
//

import Foundation
import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
