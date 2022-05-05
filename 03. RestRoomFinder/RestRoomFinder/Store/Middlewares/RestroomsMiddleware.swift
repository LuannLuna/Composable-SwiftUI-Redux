//
//  RestroomsMiddleware.swift
//  RestRoomFinder
//
//  Created by Luann Luna on 05/05/22.
//

import Foundation

func restroomMiddleware() -> Middleware<AppState> {
    
    return { state, action, dispatch in
        
        switch action {
            case let action as FetchRestroomsAction:
                getRestroomsByLatAndLng(action: action, dispatch: dispatch)
            default:
                break
        }
        
    }
    
}

private func getRestroomsByLatAndLng(action: FetchRestroomsAction, dispatch: @escaping Dispatcher) {
    
    WebService().getRestroomsByLatAndLng(lat: action.latitude, lng: action.longitude) { result in
        switch result {
            case .success(let restrooms):
                if let restrooms = restrooms {
                    dispatch(SetRestroomsAction(restrooms: restrooms))
                }
            case .failure(let error):
                print(error.localizedDescription)
        }
    }
    
}
