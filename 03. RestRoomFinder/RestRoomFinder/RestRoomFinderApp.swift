//
//  RestRoomFinderApp.swift
//  RestRoomFinder
//
//  Created by Luann Luna on 05/05/22.
//

import SwiftUI

@main
struct RestRoomFinderApp: App {
    
    init() {
        configureTheme()
    }
    
    var body: some Scene {
        let store = Store(reducer: appReducer, state: AppState(), middlewares: [restroomMiddleware()])
        
        WindowGroup {
            HomeScreenView()
                .environmentObject(store)
        }
    }
    
    private func configureTheme() {
        UINavigationBar.appearance().backgroundColor = UIColor(displayP3Red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
    }
}
