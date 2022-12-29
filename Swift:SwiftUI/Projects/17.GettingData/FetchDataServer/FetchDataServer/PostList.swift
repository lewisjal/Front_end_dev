//
//  ContentView.swift
//  FetchDataServer
//
//  Created by M_955328 on 3/22/22.
//

import SwiftUI

struct PostList: View {
    @State var posts = [Post]()
    
    var body: some View {
        List(posts) { posts in
            VStack {
                Text(posts.title).font(.title)
                Text(posts.body).font(.subheadline)
            }
        }.onAppear {
            PostsApi().loadData{
                (posts) in
                self.posts = posts
            }
        }
    }
}

struct Postlist_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
