//
//  MusicList.swift
//  MusicApp
//
//  Created by M_955328 on 3/17/22.
//

import SwiftUI

struct MusicList: View {
    @EnvironmentObject var musicData: MusicData
    
    var body: some View {
        NavigationView{
            List{
                NavigationLink{
                    MusicFavoritesDetail()
                }label:{
                    Text("Favorite Songs")
                }
                ForEach(musicData.musicArray){
                    musicArray in
                    NavigationLink{
                        MusicDetailView(music: musicArray)
                    }label: {
                        MusicRow(music: musicArray)
                    }
                }
            }.navigationTitle("Music")
        }
    }
    
    struct MusicList_Previews: PreviewProvider {
        static var previews: some View {
            MusicList().environmentObject(MusicData())
        }
    }
}

