//
//  LogMiddleware.swift
//  HelloRedux
//
//  Created by Luann Luna on 04/05/22.
//

import Foundation

func logMiddleware() -> Middleware<AppState> {
    return { state, action, dispatch in
        print("LOG MIDDLEWARE")
    }
}
