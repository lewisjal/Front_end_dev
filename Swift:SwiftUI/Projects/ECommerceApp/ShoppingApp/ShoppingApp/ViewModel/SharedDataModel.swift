//
//  SharedDataModel.swift
//  ShoppingApp
//
//  Created by M_955328 on 3/31/22.
//

import SwiftUI

class SharedDataModel: ObservableObject {
    //Detail Product Data
    @Published var detailProduct: Product?
    @Published var showDetailProduct: Bool = false
    
    //MAtched geometry effect from search page
    @Published var fromSearchPage: Bool = false
    
    //Liked products
    @Published var likedProducts: [Product] = []
    
    //Cart items
    @Published var cartProducts: [Product] = []
    
    //Calculating total amount in cart
    func getTotal()->String{
        
        var total: Int = 0
        
        cartProducts.forEach { product in
            let price = product.price.replacingOccurrences(of: "$", with: "") as NSString
            
            let quantity = product.quantity
            let priceTotal = quantity * price.integerValue
            
            total += priceTotal
            
        }
        return "$\(total)"
    }

}
