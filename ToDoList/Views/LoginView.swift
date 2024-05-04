//
//  LoginView.swift
//  ToDoList
//
//  Created by Uail on 2024-04-28.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                //header
                HeaderView(title: "To Do List", subtitle: "Get Things Done On Time!", angle: 15, background: .blue)
                
               
                
                //login form
                Form {
                    
                    //error message if not filled in
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Log in", background: Color.blue){
                        //attempt login
                        viewModel.login()
                    }
                    .padding()
                }
                .offset(y: -50)
                
                
                
                //registration
                VStack {
                    Text("New around here?")
                    
                    NavigationLink("Create an account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
