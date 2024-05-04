//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Uail on 2024-04-28.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
