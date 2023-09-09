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
    @Published var errorMessage: String = ""
    
    init(){
        
    }
    
    func login(){
        if validate() {
            
            errorMessage = ""
            
            Auth.auth().signIn(withEmail: email, password: password) { authDataResult, error in
                if let err = error {
                    self.errorMessage = err.localizedDescription
                    return
                }
                
                print(authDataResult?.description as Any)
                
                
            }
            
            
            
            
        }
    }
    
    func validate() -> Bool{
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        if !NSPredicate(format: "SELF matches %@", emailRegEx).evaluate(with: email){
            errorMessage = "Invalid Email Address"
            return false
        }
        
        let passwordRegEx = "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8}$"
        if !NSPredicate(format: "SELF matches %@", passwordRegEx).evaluate(with: password) {
            errorMessage = "Password must contain atleast one uppercase, one lowercase letter, one digit and one symbol(!@#$&*)"
            return false
        }

    
        return true
    }
    
    
    
}
