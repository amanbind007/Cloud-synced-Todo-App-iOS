//
//  TodoListItemView.swift
//  TodoList
//
//  Created by Aman Bind on 01/09/23.
//

import SwiftUI

struct TodoListItemView: View {
    
    var item : TodoItem
    @StateObject var todoListItemViewModel = TodoListItemViewViewModel()
    
    var body: some View {
        
        HStack{
            
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.title2)
                    
                
                
                HStack{
                    Image(systemName: "clock.fill")
                        .imageScale(.small)
                        .foregroundColor(Color.orange)
                    Text("DueDate : ")
                        .font(.footnote)
                        .bold()
                        .foregroundColor(.secondary)
                    Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                
            }
            Spacer()
            
            Button {
                todoListItemViewModel.toggleIsDone()
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "multiply.circle.fill")
                    .foregroundColor(item.isDone ? Color.green : Color.red)
                    .imageScale(.large)
            }

            
        }
        
    }
}

struct TodoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListItemView(item: TodoItem(id: "AMAN-BIND", title: "Aman", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970-86400, isDone: true))
    }
}
