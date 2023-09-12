//
//  TodoListViewViewModel.swift
//  TodoList
//
//  Created by Aman Bind on 10/09/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class TodoListViewViewModel: ObservableObject{
    
    @Published var sheetIsPresented: Bool = false
    
    init(){
        
    }
    
    func deleteItem(todoListItemID: String){
        let db = Firestore.firestore()
        
        if let currentUser = Auth.auth().currentUser {
            
            let userID = currentUser.uid
            db.collection("User").document(userID).collection("Todos").document(todoListItemID).delete()
            //            db.collection("User").document(userID).collection("Todos").document(todoListItemID).delete { error in
            //                if let err = error {
            //                    print(error?.localizedDescription as Any)
            //                }
            //                else{
            //                    print("Deletion Successful")
            //                }
            //            }
        }
        
    }
    
}
