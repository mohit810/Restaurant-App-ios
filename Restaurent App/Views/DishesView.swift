//
//  DishesView.swift
//  Restaurent App
//
//  Created by Mohit Yadav on 21/01/21.
//

import SwiftUI

struct DishesView: View {
    
    @State var selectedTab = Tabs.FirstTab
        
        var body: some View {
            VStack {
                HStack {
                    Spacer()
                    VStack {
                        Text("First tab")
                            .foregroundColor(selectedTab == .FirstTab ? Color.white : Color.black)
                        
                    }
                    .onTapGesture {
                        self.selectedTab = .FirstTab
                    }
                    Spacer()
                    VStack {
                        Text("Second tab")
                            .foregroundColor(selectedTab == .SecondTab ? Color.white : Color.black)
                    }
                    .onTapGesture {
                        self.selectedTab = .SecondTab
                    }
                    Spacer()
                    VStack {
                        Text("Third tab")
                            .foregroundColor(selectedTab == .ThirdTab ? Color.white : Color.black)
                    }
                    .onTapGesture {
                        self.selectedTab = .ThirdTab
                    }
                    Spacer()
                }
                .padding(.vertical)
                .background(Color.accentColor)
                
                if selectedTab == .FirstTab {
                    StartersView()
                } else if selectedTab == .SecondTab {
                    MainCourseView()
                } else {
                    DesertsView()
                }
            }
        }
}

struct DishesView_Previews: PreviewProvider {
    static var previews: some View {
        DishesView()
    }
}

enum Tabs {
    case FirstTab
    case SecondTab
    case ThirdTab
}
