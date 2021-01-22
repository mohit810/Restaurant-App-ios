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
    @State var navigationFlag: String = ""
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Prefs.plist")
    
    var body: some View {
        VStack {
            NavigationView{
                VStack {
                    if firstLoadFlag {
                        LottieView(animationName: "restaurantloader", looper: false)
                            .frame(width: 200, height: 200)
                        NavigationLink(destination: OnboardingView(data: OnboardingDataModel.data, doneFunction: {
                            self.firstLoadFlag = false
                        }) , isActive: $timerFlag) {}
                    } else {
                        VStack {
                            Image("logo")
                                .resizable()
                                .frame(width: 250, height: 250,alignment: .top)
                            VStack {
                                Spacer()
                                HStack {
                                    Image("farm_veg")
                                        .resizable()
                                        .frame(width: 40, height: 55, alignment: .leading)
                                    Text("Our Ingredients are daily supplied by local Farmers")
                                }.padding(EdgeInsets(.init(top: 0, leading: 5, bottom: 5, trailing: 0)))
                                Spacer()
                                HStack {
                                    Image("freshly_made")
                                        .resizable()
                                        .frame(width: 55, height: 55, alignment: .leading)
                                    Text("We Serve and Deliver Freshly made Delicious Food")
                                }.padding(EdgeInsets(.init(top: 0, leading: 8, bottom: 5, trailing: 0)))
                                Spacer()
                                HStack {
                                    Image("delivery")
                                        .resizable()
                                        .frame(width: 55, height: 55, alignment: .leading)
                                    Text("We also Deliver the food home for the foodie in you")
                                }.padding(EdgeInsets(.init(top: 0, leading: 8, bottom: 5, trailing: 0)))
                                Spacer()
                                HStack {
                                    Image("help_chat")
                                        .resizable()
                                        .frame(width: 55, height: 55, alignment: .leading)
                                    Text("If you have any doubt or query you can reach us through the App")
                                }.padding(EdgeInsets(.init(top: 0, leading: 8, bottom: 5, trailing: 0)))
                                Spacer()
                            }
                            Spacer()
                            HStack {
                                NavigationLink(destination: RegisterView()) {
                                    ButtonView(text: "Sign up", color: Color.accentColor)
                                        .padding(8)
                                }
                                NavigationLink(destination: LoginView()) {
                                    ButtonView(text: "Login", color: Color.accentColor)
                                        .padding(8)
                                }
                                NavigationLink(destination: HomeView()) {
                                    ButtonView(text: "Home", color: Color.accentColor)
                                        .padding(8)
                                }
                            }
                        }
                    }
                }.onAppear {
                    self.startTimer()
                }
                if navigationFlag == "1"{
                    
                }
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
