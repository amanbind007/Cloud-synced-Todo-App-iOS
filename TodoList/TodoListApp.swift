//
//  TodoListApp.swift
//  TodoList
//
//  Created by Aman Bind on 01/09/23.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

@main
struct TodoListApp: App {
    
    
    
    
    init(){
        FirebaseApp.configure()
        let userDefaults = UserDefaults.standard
        if (!userDefaults.bool(forKey: "hasRunBefore")) {
            print("The app is launching for the first time. Setting UserDefaults...")
            
            do {
                try Auth.auth().signOut()
                } catch {

                }


            // Update the flag indicator
            userDefaults.set(true, forKey: "hasRunBefore")
            userDefaults.synchronize() // This forces the app to update userDefaults

            // Run code here for the first launch

        } else {
            print("The app has been launched before. Loading UserDefaults...")
            // Run code here for every other launch but the first
        }
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
