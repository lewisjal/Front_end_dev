//
//  HomeView.swift
//  NotesApp
//
//  Created by M_955328 on 3/22/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var imageData: ImageData
    var body: some View {
        List{
            ForEach(imageData.imageNotes){ note in
                NavigationLink(destination: NoteDetailView(note: note)){
                    HStack{
                        Image(uiImage: UIImage(data: note.image)!).resizable()
                            .frame(width: 50, height: 50, alignment: .center)
                        VStack(alignment: .leading){
                            Text(note.title).lineLimit(2)
                            
                        }
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ImageData())
    }
}
