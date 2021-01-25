//
//  FirstTimeView.swift
//  Restaurent App
//
//  Created by Mohit Yadav on 17/01/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
            TabView{
                DishesView()
                    .tag(0)
                    .tabItem({
                        Image(systemName: "mail")
                        Text("Menu")
                    })
                SearchView()
                    .tag(1)
                    .tabItem({
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    })
                CartView()
                    .tag(2)
                    .tabItem({
                        Image(systemName: "cart")
                        Text("Cart")
                    })
                AccountView()
                    .tag(3)
                    .tabItem({
                        Image(systemName: "person.crop.circle")
                        Text("Account")
                    })
            }
    }
}

struct FirstTimeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
