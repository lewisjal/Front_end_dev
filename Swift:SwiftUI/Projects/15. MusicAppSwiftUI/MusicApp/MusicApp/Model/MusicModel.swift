//
//  MusicData.swift
//  MusicApp
//
//  Created by M_955328 on 3/16/22.
//

import Foundation
import SwiftUI


class MusicModel: Identifiable {
    
    var title: String
    var artist: String
    var albumImage: String
    var isFavorite: Bool
    
    init(title: String, artist: String, albumImage: String, isFavorite: Bool){
        self.title = title
        self.artist = artist
        self.albumImage = albumImage
        self.isFavorite = isFavorite
    }
    
}
