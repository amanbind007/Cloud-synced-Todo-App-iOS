//
//  NewItemViewViewModel.swift
//  TodoList
//
//  Created by Aman Bind on 10/09/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class NewItemViewViewModel :ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var errorMessage = ""
    @Published var showAlert = false
    
    
    init(){
        
    }
    
    
    func save(){
        if(title.trimmingCharacters(in: .whitespaces).isEmpty) {
            errorMessage = "Title cannot be Empty"
            showAlert = true
            return
        }
        
        // Get Current User ID
        guard let userID = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create Model
        let itemID = UUID().uuidString
        let newItem = TodoItem(
            id: itemID,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false)
        
        // Save Model
        let db = Firestore.firestore()
        db.collection("User")
            .document(userID)
            .collection("Todos")
            .document(itemID)
            .setData(newItem.asDisctionary())
        
        
        
        
        
    }
}
