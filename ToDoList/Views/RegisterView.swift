//
//  RegisterView.swift
//  ToDoList
//
//  Created by Uail on 2024-04-28.
//

import SwiftUI

struct RegisterView: View {
    
   @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack{
            HeaderView(title: "Register Here!", subtitle: "Get ready to work things out", angle: -15, background: .purple)
            
            //login form
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Register", background: Color.purple){
                    //attempt register
                    viewModel.register()
                }
                .padding()
            }
            .offset(y: -50)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
