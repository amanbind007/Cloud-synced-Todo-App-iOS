//
//  ProfileView.swift
//  TodoList
//
//  Created by Aman Bind on 01/09/23.
//

import SwiftUI
import UIKit
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ProfileView: View {
    
    @StateObject var profileViewModel = ProfileViewViewModel()
    
    @State var isImagePickerPresented = false
    @State private var selectedImage: UIImage?
    
    
    var body: some View {
        
        VStack {
            
            if let user = profileViewModel.user {
                
                VStack {
                    ZStack(alignment: .top) {
                        Rectangle()
                            .foregroundColor(.pink)
                            .edgesIgnoringSafeArea(.top)
                            .frame(height: 100)
                        
                        AsyncImage(url: URL(string: user.profile)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 180, height: 180)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 10)
                                .onTapGesture {
                                    isImagePickerPresented.toggle()
                                }
                        } placeholder: {
                            ZStack{
                                
                                Circle()
                                    .frame(width: 180, height: 180)
                                    .foregroundColor(.white)
                                
                                Image("Profile")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 180, height: 180)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle()
                                            .stroke(Color.white, lineWidth: 4)
                                    )
                                    .shadow(radius: 10)
                                    .onTapGesture {
                                        isImagePickerPresented.toggle()
                                    }
                            }
                        }
                        .offset(y:10)
                    }
                }
                
                Spacer()
                
                VStack(alignment: .leading){
                    Text("Name")
                        .font(Font.custom("Pacifico", size: 25))
                        .foregroundColor(.pink)
                        .offset(x: 10, y:22)
                    RoundedRectangle(cornerRadius: 30)
                        .frame(height: 60)
                        .foregroundStyle(.thickMaterial)
                        .overlay {
                            Text(user.name)
                                .font(.largeTitle)
                                .bold()
                        }
                        .clipped()
                        .shadow(color: .pink, radius: 10)
                    
                    
                    Spacer()
                    
                    Text("Email")
                        .font(Font.custom("Pacifico", size: 25))
                        .foregroundColor(.pink)
                        .offset(x: 10, y:22)
                    RoundedRectangle(cornerRadius: 30)
                        .frame(height: 60)
                        .foregroundStyle(.thickMaterial)
                        .overlay {
                            Text(user.email)
                                .font(.title2)
                        }
                        .clipped()
                        .shadow(color: .pink, radius: 10)
                    
                    Spacer()
                    
                    Text("Memeber Since")
                        .font(Font.custom("Pacifico", size: 25))
                        .foregroundColor(.pink)
                        .offset(x: 10, y:22)
                    RoundedRectangle(cornerRadius: 30)
                        .frame(height: 60)
                        .foregroundStyle(.thickMaterial)
                        .overlay {
                            Text(Date(timeIntervalSince1970: user.joinedOn).formatted(date: .abbreviated, time: .shortened))
                                .font(.title2)
                            
                        }
                        .clipped()
                        .shadow(color: .pink, radius: 10)
                    
                }
                .padding()
                .offset(y:-30)
                Spacer()
                
                BigButtonView(backgroundColor: .red, title: "Logout") {
                    profileViewModel.logout()
                }
                
            }else{
                Text("Profile Loading...")
                    .font(Font.custom("Pacifico", size: 35))
                    .foregroundColor(.pink)
            }
            
        }
        .onAppear{
            profileViewModel.fetchUser()
        }
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePickerView(selectedImage: $selectedImage)
                .onDisappear {
                    if let image = selectedImage {
                        profileViewModel.uploadProfileImage(image: image)
                    }
                }
        }
        
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
