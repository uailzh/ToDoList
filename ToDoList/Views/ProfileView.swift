//
//  ProfileView.swift
//  ToDoList
//
//  Created by Uail on 2024-04-28.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
               
                if let user = viewModel.user {
                    profile(user: user)
                }
                else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        //profile img
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .frame(width: 125, height: 125)
            .padding()
        
        //user info
        VStack(alignment: .leading){
            HStack{
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            
            HStack{
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            
            HStack{
                Text("Member since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        .padding()
        //sign out button
        Button("Log out") {
            //log out
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
