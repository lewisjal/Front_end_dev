//
//  Home.swift
//  StaggeredGrid
//
//  Created by M_955328 on 3/31/22.
//
import SwiftUI

struct Home: View {
    @State var posts: [Post] = []
    var body: some View {
        NavigationView{
            Staggered(columns: 2, list: posts, content: { post in
                //Post card view
                PostCardView(post: post)
                    .onAppear {
                        print(post.imageURL)
                    }
            })
                .padding(.horizontal)
                .navigationTitle("Staggered Grid")
        }
        .onAppear {
            for index in 1...10{
                posts.append(Post(imageURL: "post\(index)"))
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct PostCardView: View{
    var post: Post
    
    var body: some View{
        
        Image(post.imageURL)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
    }
}
