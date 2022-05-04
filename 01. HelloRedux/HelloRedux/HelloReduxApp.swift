//
//  HelloReduxApp.swift
//  HelloRedux
//
//  Created by Luann Luna on 04/05/22.
//

import SwiftUI

@main
struct HelloReduxApp: App {
    var body: some Scene {
        
        let store = Store(reducer: appReducer, state: AppState(), middlewares: [logMiddleware(), incrementMiddleware()])
        
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
