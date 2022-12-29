//
//  HomeView.swift
//  NotesApp
//
//  Created by M_955328 on 3/22/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var noteData: NoteData
    var body: some View {
        List{
            ForEach(noteData.newNote){ note in
                NavigationLink(destination: NoteDetailView(note: note)){
                    HStack{
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
        HomeView().environmentObject(NoteData())
    }
}
