//
//  DishCard.swift
//  Restaurent App
//
//  Created by Mohit Yadav on 25/01/21.
//

import SwiftUI

struct DishCard: View {
    
    @ObservedObject var imageLoader:ImageLoader
    var title: String
    var address: String
    var city: String
    var categories: [String]
    var kilometres: Double
    init(url:String, title: String,address: String,city: String,categories: [String],kilometres: Double) {
        imageLoader = ImageLoader(imageURL: url)
        self.title = title
        self.address = address
        self.city = city
        self.categories = categories
        self.kilometres = kilometres
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            Color.flatDarkCardBackground
            HStack {
                ZStack {
                    Image(uiImage: UIImage(data: self.imageLoader.imageData) ?? UIImage())
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 110)
                        .clipShape(Circle())
                        .padding(.horizontal)
                    
                }
                .frame(width: 100, height: 110, alignment: .center)
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.headline)
                            .fontWeight(.bold)
                            .lineLimit(2)
                            .padding(.bottom, 1)
                            .foregroundColor(Color("cardwhite"))
                        
                        Text(address)
                            .padding(.bottom, 1)
                            .foregroundColor(Color("cardwhite"))
                    }
                    .padding(.bottom, 8)
                    
                    HStack {
                        ForEach(categories, id: \.self) { category in
                            CategoryPill(categoryName: category)
                        }
                        .padding(.bottom, 2)
                    }
                    
                }
                .padding(.horizontal, 5)
            }
            .padding(15)
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

struct DishCard_Previews: PreviewProvider {
    static var previews: some View {
        DishCard(url:"https://i.redd.it/mn5m2km7hmv01.jpg", title: "efdr", address: "dcs", city: "dca", categories: ["dc"], kilometres: 4.4)
    }
}

extension UIColor {
    
    static let flatDarkBackground = UIColor(red: 36, green: 36, blue: 36)
    static let flatDarkCardBackground = UIColor(red: 46, green: 46, blue: 46)
    
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: a)
    }
}

extension Color {
    public init(decimalRed red: Double, green: Double, blue: Double) {
        self.init(red: red / 255, green: green / 255, blue: blue / 255)
    }
    
    public static var flatDarkBackground: Color {
        return Color(decimalRed: 36, green: 36, blue: 36)
    }
    
    public static var flatDarkCardBackground: Color {
        return Color(decimalRed: 46, green: 46, blue: 46)
    }
}
