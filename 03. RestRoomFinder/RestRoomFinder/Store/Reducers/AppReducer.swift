//
//  AppReducer.swift
//  RestRoomFinder
//
//  Created by Luann Luna on 05/05/22.
//

import Foundation

func appReducer(_ state: AppState, _ action: Action) -> AppState {
    var state = state
    state.restrooms = restroomsReducer(state.restrooms, action: action)
    return state
}
