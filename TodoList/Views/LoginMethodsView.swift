//
//  LoginMethodsView.swift
//  TodoList
//
//  Created by Aman Bind on 08/09/23.
//

import SwiftUI

struct LoginMethodsView: View {
    var body: some View {
        HStack{
            
            RoundedRectangle(cornerRadius: 30)
                .stroke(lineWidth: 1)
                .foregroundColor(.primary)
                .overlay {
                    Text("Login Using")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.primary)
                }
                .shadow(radius: 10)
            
            
            Spacer()
            Circle()
                .stroke(lineWidth: 1)
                .fill(.foreground)
                .overlay {
                    Image(systemName: "apple.logo")
                        .resizable()
                        .foregroundColor(.primary)
                        .aspectRatio(contentMode: .fit)
                        .padding(10)
                    
                }
                .shadow(radius: 10)
            
            Spacer()
                
            Circle()
                .fill(.background)
                .overlay {
                    Image("Google")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        
                }
            
                
            Spacer()
            Circle()
                .overlay {
                    Image("Facebook")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        
                }
            
            Spacer()
            
            Circle()
                .stroke(lineWidth: 2)
                .fill(.foreground)
                .overlay {
                    Image("Twitter")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            
            
                
        }
    }
}

struct LoginMethodsView_Previews: PreviewProvider {
    static var previews: some View {
        LoginMethodsView()
    }
}
