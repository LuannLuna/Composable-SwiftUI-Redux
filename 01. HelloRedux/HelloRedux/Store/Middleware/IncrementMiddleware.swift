//
//  IncrementMiddleware.swift
//  HelloRedux
//
//  Created by Luann Luna on 04/05/22.
//

import Foundation

func incrementMiddleware() -> Middleware<AppState> {
    return { state, action, dispatch in
        switch action {
        case _ as IncrementActionAsync:
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                dispatch(IncrementAction())
            }
        default: break
        }
    }
}
