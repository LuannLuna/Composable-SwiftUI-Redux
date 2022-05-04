//
//  AppReducer.swift
//  Movies+Redux
//
//  Created by Luann Luna on 04/05/22.
//

import Foundation

func appReducer(_ state: AppState, _ action: Action) -> AppState {
    var state = state
    state.movies = moviesReducer(state.movies, action)
    
    return state
}
