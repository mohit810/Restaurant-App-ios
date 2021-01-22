//
//  FirstTimeView.swift
//  Restaurent App
//
//  Created by Mohit Yadav on 17/01/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            TabView{
             DishesView()
                .tabItem {
                    Image("lunch")
                        .resizable()
                        .scaledToFit()
                }
            }
        }.navigationBarHidden(true)
    }
}

struct FirstTimeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
