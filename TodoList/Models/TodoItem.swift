//
//  TodoItem.swift
//  TodoList
//
//  Created by Aman Bind on 01/09/23.
//

import Foundation

struct TodoItem: Codable, Identifiable{
    
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool){
        self.isDone = state
    }
    
}
