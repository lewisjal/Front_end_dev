//
//  Product.swift
//  ShoppingApp
//
//  Created by M_955328 on 3/31/22.
//

import SwiftUI

struct ProductAPI: Codable, Identifiable {
    var id = UUID()
    var title: String
    var price: String
    var description: String
    var category: Categories
    var image: String
    var rating: Rating
}

struct Categories: Codable, Identifiable{
    var id = UUID()
    var category: String
}
struct Rating: Codable, Identifiable{
    var id = UUID()
    var rate: Int
    var count: Int
}

class Api: ObservableObject{
    @Published var posts = [ProductAPI]()
    
    func loadData(completion: @escaping ([ProductAPI]) -> ()){
        guard let url = URL(string: "https://fakestoreapi.com/products/1") else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            do {
                let posts = try JSONDecoder().decode([ProductAPI].self, from: data)
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
