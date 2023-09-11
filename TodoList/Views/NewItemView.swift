//
//  NewItemView.swift
//  TodoList
//
//  Created by Aman Bind on 01/09/23.
//

import SwiftUI

struct NewItemView: View {
    
    @Binding var sheetIsPresented : Bool
    @StateObject var newItemViewModel = NewItemViewViewModel()
    
    var body: some View {
        VStack {
            
            Text("Add New Item")
                .font(Font.custom("Pacifico", size: 50))
                .bold()
                .foregroundColor(.pink)
            
            Spacer()
            
            Section {
                RoundedRectangle(cornerRadius:25)
                    .stroke()
                    .fill(.pink)
                    .frame(height: 50)
                    .overlay {
                        TextField("Title", text: $newItemViewModel.title)
                            .padding()
                    }
            } header: {
                HStack{
                    Text("Title")
                        .font(Font.custom("Pacifico", size: 20))
                        .bold()
                        .foregroundColor(.pink)
                        .offset(x:8, y:20)
                    Spacer()
                }
                
            }
            
            Spacer()
            
            Section {
                DatePicker("Due date", selection: $newItemViewModel.dueDate, in: Date()...)
                    .datePickerStyle(.graphical)
                    .tint(.pink)
                
            } header: {
                HStack{
                    Text("Due Date")
                        .font(Font.custom("Pacifico", size: 20))
                        .bold()
                        .foregroundColor(.pink)
                        .offset(x:8, y:35)
                    Spacer()
                }
                
            }

            Spacer()
            
            BigButtonView(backgroundColor: .pink, title: "Add item") {
                
                newItemViewModel.save()
                
                if !newItemViewModel.title.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty {
                    sheetIsPresented = false
                }
                
                
                
            }
        }
        .padding()
        .alert(newItemViewModel.errorMessage, isPresented: $newItemViewModel.showAlert) {
            
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(sheetIsPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
