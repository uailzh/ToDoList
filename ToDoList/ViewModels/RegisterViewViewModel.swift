//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Uail on 2024-04-28.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel:ObservableObject {
    
    @Published var name = ""
    @Published var password = ""
    @Published var email = ""
    @Published var errorMessage = ""
    
    init(){
        
    }
    
    func register(){
        
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userID = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userID)
        }
        
    }
    
    
    
    private func insertUserRecord(id:String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    
    
    private func validate() -> Bool{
        //reset the error message
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields!"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email!"
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Please enter password longer than 6 characters!"
            return false
        }
        
        
        return true
    }
}
