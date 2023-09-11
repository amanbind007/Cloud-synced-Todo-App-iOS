//
//  TodoListView.swift
//  TodoList
//
//  Created by Aman Bind on 01/09/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct TodoListView: View {
    
    private let userId: String
    
    @StateObject var  todoListViewModel = TodoListViewViewModel()
    @FirestoreQuery var items : [TodoItem]
    
    init(userId: String) {
        self.userId = userId
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Pacifico", size: 40)!, .strokeColor: Color.pink, .foregroundColor: UIColor.systemPink]
        
        self._items = FirestoreQuery(collectionPath: "User/\(userId)/Todos")
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                List(items) { item in
                    Text(item.title)
                }
                .listItemTint(.pink)
                
                
                
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
        TodoListView(userId: "Pgytl8s6vaM4ZqunwxZ0QS03WU33")
    }
}
