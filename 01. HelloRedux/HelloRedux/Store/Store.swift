//
//  Store.swift
//  HelloRedux
//
//  Created by Luann Luna on 04/05/22.
//

import Foundation
import UIKit

typealias Reducer<State: ReduxState> = (_ state: State, _ action: Action) -> State
typealias Dispatcher = (Action) -> Void
typealias Middleware<StoreState: ReduxState> = (StoreState, Action, @escaping Dispatcher) -> Void
protocol ReduxState { }

struct AppState: ReduxState {
    var counterState = CounterState()
    var taskState = TaskState()
}

struct TaskState: ReduxState {
    var tasks: [Task] = []
}

struct CounterState: ReduxState {
    var counter: Int = 0
}

protocol Action { }

struct IncrementAction: Action { }
struct DecrementAction: Action { }
struct AddAction: Action {
    let value: Int
}

struct AddTaskAction: Action {
    let task: Task
}
struct IncrementActionAsync: Action { }

class Store<StoreState: ReduxState>: ObservableObject {
    
    var reducer: Reducer<StoreState>
    @Published var state: StoreState
    var middlewares: [Middleware<StoreState>]
    
    init(reducer: @escaping Reducer<StoreState>, state: StoreState, middlewares: [Middleware<StoreState>] = []) {
        self.reducer = reducer
        self.state = state
        self.middlewares = middlewares
    }
    
    func dispatch(action: Action) {
        DispatchQueue.main.async {
            self.state = self.reducer(self.state, action)
        }
        
        middlewares.forEach { middleware in
            middleware(state, action, dispatch)
        }
    }
}
