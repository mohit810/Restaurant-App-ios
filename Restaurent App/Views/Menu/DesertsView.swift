//
//  DesertsView.swift
//  Restaurent App
//
//  Created by Mohit Yadav on 25/01/21.
//

import SwiftUI

struct DesertsView: View {
    
    @State var models = [RedditModel]()
    @State var posts = [RedditPostModel]()
    
    var body: some View {
        ZStack {
            List(posts) { item in
                DishCard(url: item.thumbnail, title: item.title, address: item.author, city: item.author, categories: ["dcxA"], kilometres: 4.33)
                    .scaledToFit()
            }
        }.onAppear {
            self.apifunc()
        }
    }
    func apifunc() {
        Api<[RedditModel]>.get(self, path: "data.children", url: "https://www.reddit.com/top.json?limit=50") { (posts) in
            self.models = posts
            for post in posts {
                self.posts.append(post.data)
            }
            DispatchQueue.main.async() {
                print(self.posts)
                //        self.tableView.reloadData()
            }
        }
    }
}

struct DesertsView_Previews: PreviewProvider {
    static var previews: some View {
        DesertsView()
    }
}

extension DesertsView: ApiDelegate {
    
    func onError() {
        DispatchQueue.main.async() {
            let alert = UIAlertController(title: "Ups", message: "An error has occurred...", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            //self.present(alert, animated: true)
        }
    }
}
