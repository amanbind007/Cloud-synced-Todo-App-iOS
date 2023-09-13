//
//  TodoListItemViewViewModel.swift
//  TodoList
//
//  Created by Aman Bind on 12/09/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class TodoListItemViewViewModel : ObservableObject {
    
    init(){
        
    }
    
    func toggleIsDone(item: TodoItem){
        
        if let user = Auth.auth().currentUser {
            let userID = user.uid
            let db = Firestore.firestore()
            
            var itemCopy = item
            itemCopy.setDone(!item.isDone)
            
            db.collection("User").document(userID).collection("Todos").document(itemCopy.id).setData(itemCopy.asDisctionary())
        }
        
        
    }
    
}
