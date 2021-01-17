//
//  ContentView.swift
//  Restaurent App
//
//  Created by Mohit Yadav on 17/01/21.
//

import SwiftUI

struct ContentView: View {
    
    var itemArray = [Prefs]()
    @State var seconds: Int = 0
    @State var flag: Bool = false
    @State var timer : Timer? = nil
    //let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Prefs.plist")
    
    var body: some View {
        NavigationView{
            VStack {
                LottieView(animationName: "restaurantloader")
                    .frame(width: 200, height: 200)
                NavigationLink(destination: FirstTimeView(), isActive: $flag) {
                }
            }.onAppear {
                self.startTimer()
            }
        }
    }
    
    private func startTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.flag = true
        }
        
        //        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
        //            if self.seconds == 3 {
        //                print("cdxzd")
        //                self.flag = true
        //            } else {
        //                self.seconds += 1
        //            }
        //        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
