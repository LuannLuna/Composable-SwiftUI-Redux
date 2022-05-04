//
//  Movies_ReduxApp.swift
//  Movies+Redux
//
//  Created by Luann Luna on 04/05/22.
//

import SwiftUI

@main
struct Movies_ReduxApp: App {
    var body: some Scene {
        
        let store = Store(reducer: appReducer, state: AppState(), middlewares: [moviesMiddleware()])
        
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
