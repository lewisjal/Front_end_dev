//
//  ContentView.swift
//  H4X0R
//
//  Created by M_955328 on 9/8/22.
//

import SwiftUI

struct ContentView: View {
    
   @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts, rowContent: { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            })
            .navigationTitle("H4X0R NEWS")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Holá"),
//    Post(id: "3", title: "Bonjour"),
//    Post(id: "4", title: "Konichiwa")
//]





