//
//  MusicFavoritesDetail.swift
//  MusicApp
//
//  Created by M_955328 on 3/17/22.
//

import SwiftUI

struct MusicFavoritesDetail: View {
    
    @EnvironmentObject var musicData: MusicData
    
    var filteredSongs: [MusicModel]{
        musicData.musicArray.filter{ music in
            (music.isFavorite)
        }
    }
    
    var body: some View {
        List{
            ForEach(filteredSongs){
                musicArray in
                MusicRow(music: musicArray)
            }
        }
    }
}
struct MusicFavoritesDetail_Previews: PreviewProvider {
    static var previews: some View {
        MusicFavoritesDetail().environmentObject(MusicData())
    }
}

