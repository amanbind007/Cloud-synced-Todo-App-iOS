//
//  ContentView.swift
//  TodoList
//
//  Created by Aman Bind on 01/09/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var mainViewModel = MainViewViewModel()
    
    var body: some View {
        
        NavigationView {
            if mainViewModel.isSignedIn, !mainViewModel.currentUserId.isEmpty{
                
                TabView {
                    
                    TodoListView()
                        .tabItem {
                            VStack{
                                Image(systemName: "house.fill")
                                Text("Home")
                            }
                        }
                    
                    ProfileView()
                        .tabItem {
                            VStack{
                                Image(systemName: "person.fill")
                                Text("Profile")
                            }
                        }
                }
            }
            else {
                LoginView(loginViewModel: LoginViewViewModel())
                
            }
        }
        
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
