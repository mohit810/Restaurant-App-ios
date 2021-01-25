//
//  CategoryPill.swift
//  Restaurent App
//
//  Created by Mohit Yadav on 25/01/21.
//

import SwiftUI

struct CategoryPill: View {
    
    var categoryName: String
    
    var body: some View {
        ZStack {
            Text(categoryName)
                .font(.system(size: 18, weight: .regular))
                .lineLimit(2)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.green)
                .cornerRadius(5)
        }
    }
}

struct CategoryPill_Previews: PreviewProvider {
    static var previews: some View {
        CategoryPill(categoryName: "hi")
    }
}
