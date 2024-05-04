//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Uail on 2024-04-28.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel:ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {
    }
    
    func save() {
        guard canSave else {
            return
        }
        
        //get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        //create model
        let newUID = UUID().uuidString
        let newItem = ToDoListItem(
            id: newUID, title: title,
            dueDate: dueDate.timeIntervalSince1970,
            currentDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        //save model to database
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("toDos")
            .document(newUID)
            .setData(newItem.asDictionary())
    }
    
    var canSave:Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
    
   
}
