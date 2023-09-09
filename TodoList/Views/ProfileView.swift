//
//  ProfileView.swift
//  TodoList
//
//  Created by Aman Bind on 01/09/23.
//

import SwiftUI

struct ProfileView: View {
    
    @State var isPresented = false
    var body: some View {
        NavigationView {
            
            VStack{
                
                
                
                
            }
            .navigationTitle("Profile 👤")
            .toolbar {
                Button {
                    isPresented.toggle()
                } label: {
                    Image(systemName: "slider.horizontal.3")
                }

            }
            
            
        }
        .sheet(isPresented: $isPresented) {
            Form{
                Text("Aman Bind")
                Text("Rakesh jha")
                Text("Aman Bind")
                Text("Rakesh jha")
                Text("Aman Bind")
                Text("Rakesh jha")
                Text("Aman Bind")
                Text("Rakesh jha")
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
