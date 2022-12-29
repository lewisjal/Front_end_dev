//
//  PostsApi.swift
//  FetchDataServer
//
//  Created by M_955328 on 4/12/22.
//

import Foundation

class PostsApi: ObservableObject{
    @Published var posts = [Post]()
    
    func loadData(completion: @escaping ([Post]) -> ()){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            do {
                let posts = try JSONDecoder().decode([Post].self, from: data)
                print(posts)
                DispatchQueue.main.async {
                    completion(posts)
                }
            }catch let error {
                print("JSON Error \(error.localizedDescription)")
            }
        }.resume()
        
    }
}
