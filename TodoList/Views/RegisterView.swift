//
//  RegisterView.swift
//  TodoList
//
//  Created by Aman Bind on 01/09/23.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var registerViewModel: RegisterViewViewModel
    
    @FocusState private var focusField: FocusField?
    
    var body: some View {
        
        VStack{
            HeaderView(offsetForText: -170, offsetForStack: -130, title: "Register", subtitle: "Start Organizing Todo", color: .pink)
            
            
            
            VStack{
                
                if !registerViewModel.errorMessage.isEmpty {
                    Text(registerViewModel.errorMessage)
                        .foregroundColor(.red)
                        .font(.body)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal)
                }
   
                
                RoundedRectangle(cornerRadius: 25)
                    .stroke(lineWidth: 2)
                    .frame(height: 50)
                    .foregroundColor(.accentColor)
                    .overlay {
                        HStack{
                            Image(systemName: "person.fill")
                                .padding()
                            TextField("name", text: $registerViewModel.name)
                                .textFieldStyle(.plain)
                                .font(.title3)
                                .focused($focusField, equals: .name)
                                .onSubmit {
                                    focusField = .email
                                }
                                .submitLabel(.next)
                                
                        }
                    }
                    .padding()
                    
                
                RoundedRectangle(cornerRadius: 25)
                    .stroke(lineWidth: 2)
                    .frame(height: 50)
                    .foregroundColor(.accentColor)
                    .overlay {
                        HStack{
                            Image(systemName: "envelope.fill")
                                .padding()
                            TextField("email", text: $registerViewModel.email)
                                .textFieldStyle(.plain)
                                .font(.title3)
                                .focused($focusField, equals: .email)
                                .autocorrectionDisabled()
                                .textInputAutocapitalization(.never)
                                .onSubmit {
                                    focusField = .password
                                }
                                .submitLabel(.next)
                                
                                
                        }
                    }
                    .padding()
                    

                RoundedRectangle(cornerRadius: 25)
                    .stroke(lineWidth: 2)
                    .frame(height: 50)
                    .foregroundColor(.accentColor)
                    .overlay {
                        HStack{
                            Image(systemName: "key.horizontal.fill")
                                .padding()
                            SecureField("Password", text: $registerViewModel.password)
                                .textFieldStyle(.plain)
                                .font(.title3)
                                .focused($focusField, equals: .password)
                                .onSubmit {
                                    focusField = .none
                                }
                                .submitLabel(.done)
                                
                        }
                    }
                    .padding()
                
                
                BigButtonView(backgroundColor: .accentColor, title: "Register") {
                    registerViewModel.register()
                }

            }
            .offset(y: -50)
            

        }
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(registerViewModel: RegisterViewViewModel())
    }
}
