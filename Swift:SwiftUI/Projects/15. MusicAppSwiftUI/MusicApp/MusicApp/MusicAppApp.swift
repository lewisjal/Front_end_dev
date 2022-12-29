//
//  MusicAppApp.swift
//  MusicApp
//
//  Created by M_955328 on 3/16/22.
//

import SwiftUI

@main
struct MusicAppApp: App {
    @StateObject private var musicData = MusicData()
    
    var body: some Scene {
        WindowGroup {
            MusicList().environmentObject(musicData)
        }
    }
}
