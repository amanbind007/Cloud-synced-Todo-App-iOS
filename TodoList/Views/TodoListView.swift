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
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Pacifico", size: 40)!, .strokeColor: Color.pink, .foregroundColor: UIColor.systemPink]
        
        self._items = FirestoreQuery(collectionPath: "User/\(userId)/Todos")
        
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                if items.count > 0{
                    List {
                        ForEach(items) { item in
                            TodoListItemView(item: item)
                                .swipeActions {
                                    Button {
                                        todoListViewModel.deleteItem(todoListItemID:item.id)
                                    } label: {
                                        VStack{
                                            Image(systemName: "trash.fill")
                                        }
                                        
                                    }
                                    .tint(.red)
                                }
                        }
                        
                    }
                    .listStyle(.plain)
                }
                else{
                    
                    
                    
                    
                    VStack{
                        
                        
                        Image("Search")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: 250, height: 250)
                        
                        Text("Nothing to Show here")
                            .font(Font.custom("Pacifico", size: 25))
                            .foregroundColor(.pink)
                        
                        Text("Add New Todo Item")
                            .font(Font.custom("Pacifico", size: 25))
                            .underline()
                            .bold()
                            .foregroundColor(.pink)
                            .onTapGesture {
                                todoListViewModel.sheetIsPresented = true
                            }
                        
                    }
                    .padding()
                    
                    
                    
                }
                
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
