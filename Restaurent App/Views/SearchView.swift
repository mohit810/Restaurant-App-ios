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
    @State var posts = [RedditPostModel]()
    @State var searchText = ""
    
    var body: some View {
        ZStack {
            Color.init(.systemGray5)
            VStack {
            SearchBar(text: $searchText)
                .padding(.top)
                .frame(alignment: .top)
                List(posts.filter({ searchText.isEmpty ? true : $0.title.contains(searchText) })) { item in
                    DishCard(url: item.thumbnail, title: item.title, address: item.author, city: item.author, categories: ["dcxA"], kilometres: 4.33)
                        .scaledToFit()
                }
            }
        }.onAppear {
            self.apifunc()
        }
        .background(Color.init(.systemGray5))
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
