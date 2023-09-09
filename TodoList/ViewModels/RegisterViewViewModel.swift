//
//  RegisterViewViewModel.swift
//  TodoList
//
//  Created by Aman Bind on 01/09/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject{
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){
        
    }
    
    
    
    func register(){
        if validate() {
            errorMessage = ""
            
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, firebaseError in
                guard let userId = authResult?.user.uid else{
                    self?.errorMessage = firebaseError?.localizedDescription ?? ""
                    return
                }
                
                self?.inserUserRecord(userId: userId)
            }
            
            
            
            
        }
    }
    
    func inserUserRecord(userId: String){
        
        let user = User(id: userId,
                        name: name,
                        email: email,
                        joinedOn: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("User")
            .document(userId)
             .setData(user.asDisctionary())
        
        
    }
    
    func validate() -> Bool{
        
        if name.trimmingCharacters(in: .whitespaces).isEmpty {
            errorMessage = "Name cannot be NIL"
            return false
        }
        
        
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
