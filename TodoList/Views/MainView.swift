//
//  ContentView.swift
//  TodoList
//
//  Created by Aman Bind on 01/09/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            LoginView(loginViewModel: LoginViewViewModel())
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
