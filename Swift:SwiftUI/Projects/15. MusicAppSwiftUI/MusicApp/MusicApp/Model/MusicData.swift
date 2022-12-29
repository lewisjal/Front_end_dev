//
//  MusicData.swift
//  MusicApp
//
//  Created by M_955328 on 3/16/22.
//

import Foundation
import SwiftUI
import Combine

final class MusicData: ObservableObject {
   @Published var musicArray:  [MusicModel] = fillMusicArray()
}

func fillMusicArray() -> [MusicModel] {
    
    var music: [MusicModel] = []
    
    var title = "Love Yourz"
    var artist = "J.Cole"
    var albumImage = "foresthills"
    var isFavorites = true
    
    let music1 = MusicModel(title: title, artist: artist, albumImage: albumImage, isFavorite: isFavorites)
    

    title = "On the House"
    artist = "love"
    albumImage = "on-the-house"
    isFavorites = false
    
    let music2 =  MusicModel(title: title, artist: artist, albumImage: albumImage, isFavorite: isFavorites)
    
    title = "Love Yourself"
    artist = "Justin Bieber"
    albumImage = "JustinBieberLoveYourself"
    isFavorites = false
    
    let music3 = MusicModel(title: title, artist: artist, albumImage: albumImage, isFavorite: isFavorites)

    title = "God's Plan"
    artist = "Scorpian"
    albumImage = "Scorpion"
    isFavorites = true
    
    let music4 = MusicModel(title: title, artist: artist, albumImage: albumImage, isFavorite: isFavorites)
    
    title = "Hello"
    artist = "Jayz"
    albumImage = "americangangsta"
    isFavorites = true
    
    let music5 = MusicModel(title: title, artist: artist, albumImage: albumImage, isFavorite: isFavorites)
    
    title = "Viva La Vida"
    artist = "Coldplay"
    albumImage = "vivalavida"
    isFavorites = false
    
    let music6 = MusicModel(title: title, artist: artist, albumImage: albumImage, isFavorite: isFavorites)
    
    music.append(contentsOf: [music1, music2, music3, music4, music5, music6])
        
    
    return music
        }
