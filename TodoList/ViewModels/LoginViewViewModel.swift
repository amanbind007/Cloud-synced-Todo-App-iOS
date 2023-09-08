//
//  LoginViewViewModel.swift
//  TodoList
//
//  Created by Aman Bind on 01/09/23.
//

import Foundation
import FirebaseAuth


class LoginViewViewModel : ObservableObject {
    
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var errorMesssage: String = ""
    
    init(){
        
    }
    
    func login(){
        if validate() {
            print("Validation Successful")
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, firebaseError in
                if let error = firebaseError {
                    self.errorMesssage = error.localizedDescription
                    return
                }
                
                print(authResult?.description)
            }
            
            
            
            
        }
    }
    
    func validate() -> Bool{
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        if !NSPredicate(format: "SELF matches %@", emailRegEx).evaluate(with: email){
            errorMesssage = "Invalid email"
            return false
        }
        
        let passwordRegEx = "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8}$"
        if !NSPredicate(format: "SELF matches %@", passwordRegEx).evaluate(with: password) {
            errorMesssage = "Password must contain atleast one uppercase, one lowercase letter, one digit and one symbol(!@#$&*)"
            return false
        }

    
        return true
    }
    
    
    
}
