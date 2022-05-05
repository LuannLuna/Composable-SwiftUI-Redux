//
//  HomeScreenView.swift
//  RestRoomFinder
//
//  Created by Luann Luna on 05/05/22.
//

import SwiftUI
import Combine

struct HomeScreenView: View {
    
    @ObservedObject private var locationManager = LocationManager()
    @EnvironmentObject var store: Store<AppState>
    @State private var cancellables: AnyCancellable? = nil
    
    struct Props {
        let restrooms: [Restroom]
        let onFetchRestroomsByLatLng: (Double, Double) -> Void
    }
    
    private func map(_ state: RestroomState) -> Props {
        return Props(restrooms: state.restrooms) { lat, lng in
            store.dispatch(action: FetchRestroomsAction(latitude: lat, longitude: lng))
        }
    }
    
    var body: some View {
        let props = map(store.state.restrooms)
        
        VStack(alignment: .leading) {
            HStack {
                EmptyView()
            }.frame(maxWidth: .infinity, maxHeight: 44)
            Spacer()
            
            HStack {
                Text("Restrooms")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                Spacer()
                Button {
                    locationManager.updateLocation()
                } label: {
                    Image(systemName: "arrow.clockwise.circle")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            .padding()
            
            List(props.restrooms, id: \.id) { restroom in
                RestroomCell(restroom: restroom)
            }.buttonStyle(PlainButtonStyle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            self.cancellables = self.locationManager.$location.sink { location in
                if let location = location {
                    props.onFetchRestroomsByLatLng(location.coordinate.latitude, location.coordinate.longitude)
                }
            }
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
            .environmentObject(Store(reducer: appReducer, state: AppState(), middlewares: [restroomMiddleware()]))
    }
}

struct RestroomCell: View {
    let restroom: Restroom
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(restroom.name ?? "No name available")
                    .font(.headline)
                Spacer()
                Text(String(format: "%.2f miles", restroom.distance))
            }
            .padding(.top, 10)
            Text(restroom.address)
                .font(.subheadline)
                .opacity(0.5)
            
            Button("Directions") {
                guard let targetUrl = URL(string: "https://maps.apple.com/?address=\(restroom.address.urlEncode ?? "")") else { return }
                
                if UIApplication.shared.canOpenURL(targetUrl) {
                    UIApplication.shared.open(targetUrl)
                }
            }
            .font(.caption)
            .foregroundColor(.white)
            .padding(6)
            .background(Color.green)
            .cornerRadius(6)
            
            Text(restroom.comment ?? "")
                .font(.footnote)
            
            HStack {
                Text(restroom.accessible ? "♿️" : "")
            }
        }
    }
}
