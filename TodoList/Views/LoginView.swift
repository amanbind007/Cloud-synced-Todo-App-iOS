//
//  LoginView.swift
//  TodoList
//
//  Created by Aman Bind on 01/09/23.
//

import SwiftUI


enum FocusField: Hashable{
    case name
    case email
    case password
}

struct LoginView: View {
    
    @StateObject var loginViewModel: LoginViewViewModel
    
    @FocusState private var focusedField: FocusField?
    
    var body: some View {
        VStack{
            HeaderView(offsetForText: -140, offsetForStack: -80, title: "To Do List", subtitle: "Get Things Done", color: .pink)
            Spacer()
            
            
            VStack{
                
                if !loginViewModel.errorMessage.isEmpty {
                    Text(loginViewModel.errorMessage)
                        .foregroundColor(.red)
                        .font(.body)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal)
                }
                
                RoundedRectangle(cornerRadius: 25)
                    .stroke(lineWidth: 2)
                    .frame(height: 50)
                    .foregroundColor(.mint)
                    .overlay {
                        HStack{
                            Image(systemName: "envelope.fill")
                                .padding()
                            TextField("email", text: $loginViewModel.email)
                                .textFieldStyle(.plain)
                                .font(.title3)
                                .autocorrectionDisabled()
                                .textInputAutocapitalization(.never)
                                .focused($focusedField, equals: .email)
                                .onAppear{
                                    self.focusedField = .email
                                }
                                .onSubmit {
                                    focusedField = .password
                                }
                                .submitLabel(.next)
                                
                                
                        }
                    }
                    .padding()

                RoundedRectangle(cornerRadius: 25)
                    .stroke(lineWidth: 2)
                    .frame(height: 50)
                    .foregroundColor(.mint)
                    .overlay {
                        HStack{
                            
                            Image(systemName: "key.horizontal.fill")
                                .padding()
                            SecureField("Password", text: $loginViewModel.password)
                                .textFieldStyle(.plain)
                                .font(.title3)
                                .focused($focusedField, equals: .password)
                                .onSubmit {
                                    focusedField = .none
                                }
                                .submitLabel(.done)
                                
                        }
                    }
                    .padding()
                
                
                
                BigButtonView(backgroundColor: .accentColor, title: "Login") {
                    loginViewModel.login()
                }
                .shadow(radius: 10)
                
                RoundedRectangle(cornerRadius: 25)
                    .fill(.background)
                    .frame(height: 50)
                    .shadow(radius: 15)
                    .overlay {
                        LoginMethodsView()
                            .padding(3)
                        
                        
                    }
                    .padding()
                
                
                
                
                
            }
            
            Spacer()
            

            VStack{
                Text("New around here?")
                    .font(.title3)
                    .bold()
                
                NavigationLink("Create New Account Here") {
                    RegisterView(registerViewModel: RegisterViewViewModel())
                }
                
                
            }.padding(50)
            
            
            
            
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(loginViewModel: LoginViewViewModel())
    }
}
