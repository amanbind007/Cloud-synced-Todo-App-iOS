//
//  TodoListView.swift
//  TodoList
//
//  Created by Aman Bind on 01/09/23.
//

import SwiftUI

struct TodoListView: View {
    
    private let userId: String
    
    @StateObject var  todoListViewModel = TodoListViewViewModel()
    
    init(userId: String) {
        self.userId = userId
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Pacifico", size: 40)!, .strokeColor: Color.pink, .foregroundColor: UIColor.systemPink]
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                
                
            }
            .navigationTitle(
                Text("Todo List 📝")
            )
            .toolbar {
                ToolbarItem {
                    Button {
                        //Action
                        todoListViewModel.sheetIsPresented.toggle()
                        
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $todoListViewModel.sheetIsPresented) {
                NewItemView(sheetIsPresented: $todoListViewModel.sheetIsPresented)
            }  
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(userId: "")
    }
}
