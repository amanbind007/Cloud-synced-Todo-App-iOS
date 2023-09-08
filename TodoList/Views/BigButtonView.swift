//
//  BigButtonView.swift
//  TodoList
//
//  Created by Aman Bind on 08/09/23.
//

import SwiftUI

struct BigButtonView: View {
    
    let backgroundColor : Color
    let title : String
    let action : ()->Void
    
    var body: some View {
        Button {
            action()
        } label: {
            
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .frame(height: 50)
                    .foregroundColor(backgroundColor)
                Text(title)
                    .font(.title2)
                    .foregroundColor(Color.white)
                    .bold()
                
            }.padding()
            
        }
    }
}

struct BigButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BigButtonView(backgroundColor: Color.red, title: "Demo Title", action: {
            
            print("Hello")
        })
    }
}
