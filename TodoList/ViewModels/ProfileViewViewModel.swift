//
//  ProfileViewViewModel.swift
//  TodoList
//
//  Created by Aman Bind on 10/09/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

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
    
    
    func uploadProfileImage(image: UIImage){
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        
        let db = Firestore.firestore()
        fetchUser()

        if let imageData = image.jpegData(compressionQuality: 0.5) {
            let storage = Storage.storage()
            let storageReference = storage.reference()
            let profileImageRef = storageReference.child("profileImages/\(userId).jpg")
            
            profileImageRef.putData(imageData, metadata: nil) { (_, error) in
                if let error = error {
                    print("Error uploading image: \(error.localizedDescription)")
                } else {
                    // Image uploaded successfully, get the download URL
                    profileImageRef.downloadURL { (url, error) in
                        if let downloadURL = url {
                            // Update the user's profile with the new image URL
                            if let user = self.user {
                                var userCopy = User(id: user.id, name: user.name, email: user.email, joinedOn: user.joinedOn, profile: downloadURL.absoluteString)
                                
                                db.collection("User").document(userId).setData(userCopy.asDisctionary())
                            }
                            
                        } else if let error = error {
                            print("Error getting download URL: \(error.localizedDescription)")
                        }
                    }
                }
            }
        }
        
        
        
    }
    
    func logout(){
        do {
            try Auth.auth().signOut()
        }
        catch{
            print(error)
        }
    }
    
}
