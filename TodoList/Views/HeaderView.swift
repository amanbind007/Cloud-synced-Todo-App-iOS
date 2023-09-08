//
//  HeaderView.swift
//  TodoList
//
//  Created by Aman Bind on 08/09/23.
//

import SwiftUI

struct HeaderView: View {
    
    @State var offsetForText : CGFloat
    @State var offsetForStack : CGFloat
    @State var title : String
    @State var subtitle : String
    @State var color : Color
    
    
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(color)
                .frame(width: 550, height: 300)
                .rotationEffect(Angle.degrees(-15))
                .offset(y:offsetForText)
            
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(color)
                .frame(width: 550, height: 300)
                .rotationEffect(Angle.degrees(15))
                .offset(y:offsetForText)
            
            
            VStack{
                Text(title)
                    .font(Font.custom("Pacifico", size: 50))
                    .foregroundColor(.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
            .offset(y: offsetForStack)
 
        }
        
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(offsetForText: -140, offsetForStack: -80, title: "Heading", subtitle: "Subheading", color: .green)
    }
}
