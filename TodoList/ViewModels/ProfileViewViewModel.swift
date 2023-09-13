//
//  ProfileViewViewModel.swift
//  TodoList
//
//  Created by Aman Bind on 10/09/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewViewModel : ObservableObject {
    
    @Published var user : User? = nil
    
    init(){
        
    }
    
    func fetchUser(){
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("User").document(userId).getDocument {  snapshot, error in
            guard let data = snapshot?.data() , error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.user = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joinedOn: data["joinedOn"] as? TimeInterval ?? 0.0,
                    profile: data["profile"] as? String ?? "")
            }
            
            
        }
    }
    
    func logout(){
        
    }

}
