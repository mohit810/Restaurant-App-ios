//
//  SearchView.swift
//  Restaurent App
//
//  Created by Mohit Yadav on 21/01/21.
//

import SwiftUI

struct SearchView: View {
    
    @State var flag = true
    @State var models = [RedditModel]()
    
    var body: some View {
        ZStack {
            Button(action: { apifunc() }) {
                Text("hest")
            }

        }.alert(isPresented: $flag, content: {
            Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
        })
    }
    func apifunc() {
        Api<[RedditModel]>.get(self, path: "data.children", url: "https://www.reddit.com/top.json?limit=50") { (posts) in
            models = posts
            DispatchQueue.main.async() {
                print("hi")
        //        self.tableView.reloadData()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

extension SearchView: ApiDelegate {

    func onError() {
        DispatchQueue.main.async() {
            let alert = UIAlertController(title: "Ups", message: "An error has occurred...", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            //self.present(alert, animated: true)
        }
    }
}
