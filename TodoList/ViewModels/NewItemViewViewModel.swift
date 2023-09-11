//
//  NewItemViewViewModel.swift
//  TodoList
//
//  Created by Aman Bind on 10/09/23.
//

import Foundation

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
        
        
    }
}
