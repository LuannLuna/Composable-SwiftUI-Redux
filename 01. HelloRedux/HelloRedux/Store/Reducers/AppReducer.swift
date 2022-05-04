//
//  AppReducer.swift
//  HelloRedux
//
//  Created by Luann Luna on 04/05/22.
//

import Foundation

func appReducer(_ state: AppState, _ action: Action) -> AppState {
    var state = state
    state.counterState = counterReducer(state.counterState, action)
    state.taskState = taskReducer(state.taskState, action)
    return state
}
