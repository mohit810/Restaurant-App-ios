//
//  DishesView.swift
//  Restaurent App
//
//  Created by Mohit Yadav on 21/01/21.
//

import SwiftUI

struct DishesView: View {
    
    @State private var selectedTab: Int = 0
    
    var body: some View {
        VStack {
            TabView {
                Text("The First Tab")
                        .tabItem {
                            Image(systemName: "1.square.fill")
                            Text("First")
                        }
                    Text("Another Tab")
                        .tabItem {
                            Image(systemName: "2.square.fill")
                            Text("Second")
                        }
                    Text("The Last Tab")
                        .tabItem {
                            Image(systemName: "3.square.fill")
                            Text("Third")
                        }
                }
            .font(.headline)
            
//            Picker("yg", selection: $selectedTab) {
//                       Text("First").tag(0)
//                       Text("Second").tag(1)
//                       Text("Third").tag(2)
//                   }
//
//                   switch(selectedTab) {
//                       case 0: StartersView()
//                       case 1: MainCourseView()
//                       case 2: DesertsView()
//                   default:
//                    StartersView()
//                   }
               }
    }
}

struct DishesView_Previews: PreviewProvider {
    static var previews: some View {
        DishesView()
    }
}
