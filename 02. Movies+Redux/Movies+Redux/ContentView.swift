//
//  ContentView.swift
//  Movies+Redux
//
//  Created by Luann Luna on 04/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var store: Store<AppState>
    @State private var search: String = ""
    
    struct Props {
        let movies: [Movie]
        let onSearch: (String) -> Void
    }
    
    private func map(state: MoviesState) -> Props {
        return Props(movies: state.movies) { keyword in
            store.dispatch(action: FetchMovies(search: keyword))
        }
    }
    
    var body: some View {
        let props = map(state: store.state.movies)
        
        return VStack {
            
            TextField("Search", text: $search, onEditingChanged: { _ in
                
            }, onCommit: {
                props.onSearch(search)
            })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            List(props.movies, id: \.imdbID) { movie in
                NavigationLink(destination: MovieDetailsView(movie: movie)) {
                    MovieCell(movie: movie)
                }
            }.listStyle(PlainListStyle())
        }
        .navigationTitle("Movies")
        .embedInNavigationView()
        
        .onAppear {
            props.onSearch("Batman")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Store(reducer: appReducer, state: AppState(), middlewares: [moviesMiddleware()]))
    }
}

struct MovieCell: View {
    let movie: Movie
    var body: some View {
        HStack(alignment: .top) {
            URLImageView(url: movie.poster)
                .frame(width: 100, height: 125)
                .cornerRadius(10)
            Text(movie.title)
        }
    }
}
