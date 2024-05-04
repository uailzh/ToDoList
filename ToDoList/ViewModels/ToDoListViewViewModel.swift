//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Uail on 2024-04-28.
//

import Foundation
import FirebaseFirestore

class ToDoListViewViewModel:ObservableObject {
    
   @Published var showingNewItemView = false
    private let userId:String
    
    
    init(userId: String) {
        self.userId = userId
    }
    
    
    func delete(id:String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("toDos")
            .document(id)
            .delete()
    }
    
   
}
