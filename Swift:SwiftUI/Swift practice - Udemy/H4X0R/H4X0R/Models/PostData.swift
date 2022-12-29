//
//  PostData.swift
//  H4X0R
//
//  Created by M_955328 on 9/13/22.
//

import Foundation

struct Results: Decodable{
    let hits : [Post]
}

struct Post: Decodable, Identifiable{
    var id: String {
        return objectID
    }
    let objectID: String
    let points : Int
    let title : String
    let url : String?
}
