//
//  Product.swift
//  ShoppingApp
//
//  Created by M_955328 on 3/30/22.
//

import SwiftUI

//Product Model
struct Product: Hashable, Identifiable{
    var id = UUID()
    var type: ProductType
    var title: String
    var subtitle: String
    var description: String = ""
    var price: String
    var productImage: String = ""
    var quantity: Int = 1
}

enum ProductType: String, CaseIterable{
    case Wearable = "Wearable"
    case Laptops = "Laptops"
    case Phones = "Phones"
    case Tablets = "Tablets"
    case Desktop = "Desktop"
}
