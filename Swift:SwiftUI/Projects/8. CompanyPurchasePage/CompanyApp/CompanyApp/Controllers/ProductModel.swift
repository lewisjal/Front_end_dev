//
//  ProductModel.swift
//  CompanyApp
//
//  Created by M_955328 on 2/24/22.
//

import Foundation

class ProductModel{
    var title: String?
    var description: String?
    var icon: String?
    var downloadImage: String?
    var price: String?
    
    
}
enum CurrentState{
    case downloading
    case downloaded
    case notDownloaded
    case paused
}
