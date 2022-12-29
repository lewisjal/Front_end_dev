//
//  CommentsStruct.swift
//  Social Media
//
//  Created by M_955328 on 3/7/22.
//

import Foundation

struct CommentsModal: Decodable{
    var postId: Int?
    var id: Int?
    var name: String?
    var email: String?
    var body: String?
    
}
