//
//  HomeViewModel.swift
//  ShoppingApp
//
//  Created by M_955328 on 3/30/22.
//

import SwiftUI

class HomeViewModel: ObservableObject{
    
    @Published var productType : ProductType = .Wearable
    
    @Published var products: [Product] =
    
    [
        Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 6", price: "$359", productImage: "AppleWatch6"),
        Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 4", price: "$250", productImage: "AppleWatch4"),
        Product(type: .Wearable, title: "Samsung Watch", subtitle: "Gear S3", price: "$180", productImage: "GearS3"),
        Product(type: .Phones, title: "iPhone 13", subtitle: "A15", price: "699", productImage: "iPhone13"),
        Product(type: .Phones, title: "iPhone 12", subtitle: "A14", price: "$599", productImage: "iPhone12"),
        Product(type: .Phones, title: "iPhone 11", subtitle: "A13", price: "$499", productImage: "iPhone11"),
        Product(type: .Phones, title: "iPhone SE", subtitle: "A15", price: "$399", productImage: "iPhoneSE"),
        Product(type: .Laptops, title: "Macbook Air", subtitle: "M1", price: "$999", productImage: "MacbookAir"),
        Product(type: .Laptops, title: "Macbook Pro", subtitle: "M1", price: "$1299", productImage: "MacbookPro"),
        Product(type: .Tablets, title: "iPad Pro", subtitle: "M1", price: "$999", productImage: "iPadPro"),
        Product(type: .Tablets, title: "iPad Air", subtitle: "A14", price: "$699", productImage: "iPadAir"),
        Product(type: .Tablets, title: "iPad Mini", subtitle: "A13", price: "$499", productImage: "iPadMini"),
        Product(type: .Desktop, title: "iMac", subtitle: "24 inches", price: "$1599", productImage: "iMac"),
    ]
    
    //Filtering the products
    @Published var filteredProducts: [Product] = []
    
    @Published var searchText: String = ""
    @Published var searchActivated: Bool = false

    init(){
        filterProductByType()
    }
    
    func filterProductByType(){
        DispatchQueue.global(qos: .userInteractive).async {
            let results = self.products
            //Using lazy to reduce amount of memory being used
                .lazy
                .filter{ product in
                    return product.type == self.productType
                }
            //Limit results
                .prefix(4)
            
            DispatchQueue.main.async {
                self.filteredProducts = results.compactMap({ product in
                    return product
                })
            }
        }
    }
  
}


