//
//  MoviesReducer.swift
//  Movies+Redux
//
//  Created by Luann Luna on 04/05/22.
//

import Foundation

func moviesReducer(_ state: MoviesState, _ action: Action) -> MoviesState {
    var state = state
    switch action {
    case let action as SetMovies:
        state.movies = action.movies
    case let action as SetMovieDetails:
        state.selectedMovieDetail = action.detail
    default: break
    }
    return state
}
