//
//  MoviesMiddleware.swift
//  Movies+Redux
//
//  Created by Luann Luna on 04/05/22.
//

import Foundation

func moviesMiddleware() -> Middleware<AppState> {
    return { state, action, dispatch in
        switch action {
        case let action as FetchMovies:
            HTTPClient().getMoviesBy(search: action.search.urlEncode) { result in
                switch result {
                case .success(let movies):
                    if let movies = movies {
                        dispatch(SetMovies(movies: movies))
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        case let action as FetchMovieDetails:
            HTTPClient().getMovieDetailsBy(imdbId: action.imdbId) { result in
                switch result {
                case .success(let response):
                    dispatch(SetMovieDetails(detail: response))
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        default: break
        }
    }
}
