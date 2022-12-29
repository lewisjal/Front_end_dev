//
//  MusicRow.swift
//  MusicApp
//
//  Created by M_955328 on 3/17/22.
//

import SwiftUI

struct MusicRow: View {
    
    @EnvironmentObject var musicData: MusicData
    
    var music: MusicModel
    
    var body: some View {
        HStack{
            if let image = music.albumImage{
                Image(image).resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)).aspectRatio(contentMode: .fit).frame(width: 40, height: 40).scaledToFit()
            }
            VStack{
                if let title = music.title{
                    Text(title)
                }
                if let artist = music.artist{
                    Text(artist).font(.subheadline)
                }
            }
            Spacer()
            if music.isFavorite{
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct MusicRow_Previews: PreviewProvider {
    static var previews: some View {
        MusicRow(music: MusicData().musicArray[0]).previewLayout(.fixed(width: 300, height: 40)).environmentObject(MusicData())
    }
}

