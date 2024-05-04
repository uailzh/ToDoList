//
//  NewItemView.swift
//  ToDoList
//
//  Created by Uail on 2024-04-28.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented:Bool
    
    var body: some View {
        VStack{
            
            Text("New Task")
                .font(.system(size: 32))
                .bold()
                .padding()
            
            Form {
                //title
                TextField("Task Name", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                //Due date
                DatePicker("Due Date:", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                //button
                TLButton(title: "Save Task", background: Color.blue) {
                   
                    if viewModel.canSave {
                        viewModel.save()
                        //closes new task view
                        newItemPresented = false
                    }
                    else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
                
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in task name and pick due date as from today or farther")
                )
            }
        }
       
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
       return true
    }, set: { _ in
        
    }))
}
