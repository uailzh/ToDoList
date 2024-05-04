//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Uail on 2024-04-28.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
   
    
    init(userId: String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/toDos")
        
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                List(items) {
                    item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button{
                                //delete
                                viewModel.delete(id: item.id)
                            }
                        label: {
                            Text("Delete")
                                
                        }
                        .tint(.red)
                        
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                //some action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
                
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "FuK9diEnaaYnHBD9nGQxjs0Mnfr2")
}
