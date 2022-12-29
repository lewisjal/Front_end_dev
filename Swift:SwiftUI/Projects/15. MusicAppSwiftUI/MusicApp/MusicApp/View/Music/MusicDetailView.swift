//
//  MusicDetailView.swift
//  MusicApp
//
//  Created by M_955328 on 3/17/22.
//

import SwiftUI

struct MusicDetailView: View {
    
    @EnvironmentObject var musicData: MusicData
    
    var music: MusicModel
    
    var musicIndex : Int {
        musicData.musicArray.firstIndex { mus in
            mus.id == music.id
        }!
    }
    
    var body: some View {
        ZStack{
            Image(music.albumImage)
                .scaledToFill()
                .blur(radius:10)
            VStack{
                VStack{
                    if let image = music.albumImage{
                        Image(image)
                            .resizable(capInsets: EdgeInsets(top: 1.0, leading: 1.0, bottom: 1.0, trailing: 1.0))
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .frame(height: 300.0)
                if let title = music.title{
                    Text(title)
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                        .frame(width: 200.0, height: 100.0)
                        
                }
                if let artist = music.artist{
                    Text(artist).font(.subheadline).foregroundColor(Color.white).frame(width: 150.0)
                }
                FavoriteButton(isSet: $musicData.musicArray[musicIndex].isFavorite)
            }
        }
    }
}

struct MusicDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MusicDetailView(music: MusicData().musicArray[0]).environmentObject(MusicData())
    }
}
