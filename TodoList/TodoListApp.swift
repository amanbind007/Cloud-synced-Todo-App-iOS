//
//  TodoListApp.swift
//  TodoList
//
//  Created by Aman Bind on 01/09/23.
//

import SwiftUI
import FirebaseCore

@main
struct TodoListApp: App {
    
    
    init(){
        
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
