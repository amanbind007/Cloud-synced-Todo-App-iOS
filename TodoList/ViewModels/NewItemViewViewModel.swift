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
    
    
    init(){
        
    }
    
    
    func save(){
        
    }
}
