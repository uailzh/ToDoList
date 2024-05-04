//
//  ContentView.swift
//  ToDoList
//
//  Created by Uail on 2024-04-28.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            
            accountView
            
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        //signed in state
        TabView{
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    MainView()
}
