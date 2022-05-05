//
//  RestroomsReducer.swift
//  RestRoomFinder
//
//  Created by Luann Luna on 05/05/22.
//

import Foundation

func restroomsReducer(_ state: RestroomState, action : Action) -> RestroomState {
    var state = state
    switch action {
    case let action as SetRestroomsAction:
        state.restrooms = action.restrooms
    default: break
    }
    return state
}
