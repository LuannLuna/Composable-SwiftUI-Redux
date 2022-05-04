//
//  AddTaskView.swift
//  HelloRedux
//
//  Created by Luann Luna on 04/05/22.
//

import SwiftUI

struct AddTaskView: View {
    
    @State private var name: String = ""
    @EnvironmentObject var store: Store<AppState>
    
    struct Props {
        
        let task: [Task]
        
        let onTaskAdded: (Task)->Void
    }
    
    private func map(state: TaskState) -> Props {
        return Props(task: state.tasks) { task in
            store.dispatch(action: AddTaskAction(task: task))
        }
    }
    
    var body: some View {
        
        let props = map(state: store.state.taskState)
        
        return VStack {
            TextField("Enter task", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button {
                let task = Task(title: name)
                props.onTaskAdded(task)
            } label: {
                Text("Add")
            }
            
            List(props.task, id: \.id) { task in
                Text(task.title)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(Store(reducer: appReducer, state: AppState()))
    }
}
