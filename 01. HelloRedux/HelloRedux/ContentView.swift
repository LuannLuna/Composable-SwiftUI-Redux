//
//  ContentView.swift
//  HelloRedux
//
//  Created by Luann Luna on 04/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented: Bool = false
    @EnvironmentObject var store: Store<AppState>
    
    struct Props {
        let counter: Int
        let onIncrement: ()->Void
        let onDecrement: ()->Void
        let onAdd: (Int)->Void
        let onIncrementAsync: ()->Void
    }
    
    private func map(state: CounterState) -> Props {
        return Props(counter: state.counter, onIncrement: {
            store.dispatch(action: IncrementAction())
        }, onDecrement: {
            store.dispatch(action: DecrementAction())
        }, onAdd: { value in
            store.dispatch(action: AddAction(value: value))
        }, onIncrementAsync: {
            store.dispatch(action: IncrementActionAsync())
        })
    }
    
    var body: some View {
        let props = map(state: store.state.counterState)
        
        return VStack {
            Text("\(props.counter)")
                .padding()
            
            Button {
                props.onIncrement()
            } label: {
                Text("Increment")
            }
            
            Button {
                props.onDecrement()
            } label: {
                Text("Decrement")
            }
            
            Button {
                props.onAdd(10)
            } label: {
                Text("on Add 10")
            }
            
            Button {
                props.onIncrementAsync()
            } label: {
                Text("Increment Async")
            }
            
            Spacer()
            
            Button {
                isPresented = true
            } label: {
                Text("Add Task")
            }
            
            Spacer()
        }
        .sheet(isPresented: $isPresented) {
            AddTaskView()
                .environmentObject(store)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Store(reducer: appReducer, state: AppState()))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
