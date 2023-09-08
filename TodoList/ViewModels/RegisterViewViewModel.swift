//
//  RegisterViewViewModel.swift
//  TodoList
//
//  Created by Aman Bind on 01/09/23.
//

import Foundation

class RegisterViewViewModel: ObservableObject{
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init(){
        
    }
    
    func register(){
        
        
    }
    
    func validate(){
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF matches @%", emailRegEx)
        predicate.evaluate(with: email)
        
    }
    
    
}
