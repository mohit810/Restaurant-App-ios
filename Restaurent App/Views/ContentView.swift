//
//  ContentView.swift
//  Restaurent App
//
//  Created by Mohit Yadav on 17/01/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var prefs = [Prefs]()
    @State var seconds: Int = 0
    @State var timerFlag: Bool = false
    @State var firstLoadFlag: Bool = true
    @State var timer : Timer? = nil
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Prefs.plist")
    
    var body: some View {
        NavigationView{
            VStack {
                if firstLoadFlag {
                    LottieView(animationName: "restaurantloader")
                        .frame(width: 200, height: 200)
                    NavigationLink(destination: OnboardingView(data: OnboardingDataModel.data, doneFunction: {
                        self.firstLoadFlag = false
                    }) , isActive: $timerFlag) {}
                } else {
                    HStack {
                        ButtonView(text: "Sign up", color: Color.accentColor).padding(8)
                        ButtonView(text: "Login", color: Color.accentColor).padding(8)
                        ButtonView(text: "Home", color: Color.accentColor).padding(8)
                    }.position(x: 10.0, y: 10.0)
                }
            }.onAppear {
                self.startTimer()
            }
        }
    }
    
    private func startTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.timerFlag = Checker()
        }
    }
    
    private func Checker() -> Bool {
        if let data = try? Data(contentsOf: dataFilePath!){ //try? lets the code know that the result may be empty
            let decoder = PropertyListDecoder()
            do{
                prefs = try decoder.decode([Prefs].self, from: data)
                for pref in prefs {
                    firstLoadFlag = pref.firstLoad
                }
            } catch {
                print(error.localizedDescription)
            }
        } else {
            var newPrefs = Prefs()
            newPrefs.firstLoad = false
            firstLoadFlag = true
            prefs.append(newPrefs)
            self.savePrefs()
        }
        return true
    }
    
    private func savePrefs() {
        let encoder = PropertyListEncoder()
        do{
            let data = try encoder.encode(self.prefs)
            try data.write(to: self.dataFilePath!)
        } catch{
            print(error.localizedDescription)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
