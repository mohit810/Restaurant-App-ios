//
//  Button.swift
//  Restaurent App
//
//  Created by Mohit Yadav on 19/01/21.
//

import SwiftUI

struct ButtonView: View {
    
    var text: String
    var color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(color)
            .frame(height: 50)
            .overlay(HStack {
                Text(text)
            })
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "hello", color: Color.accentColor)
            .previewLayout(.sizeThatFits)
    }
}
