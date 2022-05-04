//
//  MovieDetailsView.swift
//  Movies+Redux
//
//  Created by Luann Luna on 04/05/22.
//

import SwiftUI

struct MovieDetailsView: View {
    
    @EnvironmentObject var store: Store<AppState>
    let movie: Movie
    
    struct Props {
        let deetails: MovieDetail?
        let onLoadMovieDetails: (String) -> Void
    }
    
    private func map(state: MoviesState) -> Props {
        return Props(deetails: state.selectedMovieDetail) { id in
            store.dispatch(action: FetchMovieDetails(imdbId: id))
        }
    }
    
    var body: some View {
        let props = map(state: store.state.movies)
        
        return VStack {
            Group {
                if let details = props.deetails {
                    VStack {
                        HStack {
                            Spacer()
                            URLImageView(url: details.poster)
                            Spacer()
                        }
                        
                        Text(details.title).padding(5)
                            .font(.title)
                        Text(details.plot).padding(5)
                        
                        HStack {
                            Text("Rating")
                            RatingView(rating: .constant(details.imdbRating.asInt))
                        }.padding()
                        
                        Spacer()
                    }
                } else {
                    Text("Loading...")
                }
            }
        }.onAppear {
            props.onLoadMovieDetails(movie.imdbID)
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: Movie(title: "Batman", year: "", imdbID: "", type: .movie, poster: ""))
            .environmentObject(Store(reducer: appReducer, state: AppState()))
    }
}
