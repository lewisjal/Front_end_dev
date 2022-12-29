//
//  library.swift
//  FetchDataServer
//
//  Created by M_955328 on 3/22/22.
//

import Foundation
import SwiftUI

struct Post: Codable, Identifiable{
    let id = UUID()
    var title: String
    var body: String
}


