//
//  Model.swift
//  JSONDataFile
//
//  Created by M_955328 on 3/1/22.
//

import Foundation

//struct Photos: Decodable{
//    let photo: [PhotosData]
//}


struct PhotosData: Decodable {
    
    let id: Int
    let title: String?
    let url: String?
    let thumbnailURL: String?
}

//struct Photo: Decodable {
//
//    let id: Int
//    let title: String?
//    let url: URL
//    let thumbnailURL: URL
//
//    private enum CodingKeys: String, CodingKey {
//        case title
//    }
//}
