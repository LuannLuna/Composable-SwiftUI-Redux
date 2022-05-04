//
//  CounterReducer.swift
//  HelloRedux
//
//  Created by Luann Luna on 04/05/22.
//

import Foundation

func counterReducer(_ state: CounterState, _ action: Action) -> CounterState {
    
    var state = state
    switch action {
    case _ as IncrementAction:
        state.counter += 1
    case _ as DecrementAction:
        state.counter -= 1
    case let action as AddAction:
        state.counter += action.value
    default: break
    }
    
    return state
}
