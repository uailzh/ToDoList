//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Uail on 2024-04-28.
//

import SwiftUI

struct ToDoListItemView: View {
    
    @StateObject var viewModel = ToDoListItemViewViewModel()
    
    let item:ToDoListItem
    
    var body: some View {
        
        HStack{
            
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title)
                    
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
            }
        }
    }
}

#Preview {
    ToDoListItemView(item: .init(id: "123", title: "Buy eggs", dueDate: Date().timeIntervalSince1970, currentDate: Date().timeIntervalSince1970, isDone: false))
}
