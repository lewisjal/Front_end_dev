//
//  ContentView.swift
//  NotesApp
//
//  Created by M_955328 on 3/22/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var isPresentingDetailView = false
    @StateObject var data = NoteData()
    @EnvironmentObject var noteData: NoteData
    
    var body: some View {
        NavigationView{
            VStack{
                if data.newNote.isEmpty {
                    Text("Try adding a note!")
                        .italic()
                        .foregroundColor(.gray)
                }else{
                    HomeView()
                }
            }.navigationTitle("Notes")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button{
                            isPresentingDetailView = true
                        }label:{
                            Label("Note", systemImage: "plus")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button{
                            withAnimation {
                                data.resetUserData()
                            }
                        }label:{
                            Label("Trash", systemImage: "trash")
                        }.tint(.red)
                    }
                }
                .sheet(isPresented: $isPresentingDetailView) {
                    NewNoteView(note: Note(id: UUID(), title: "New Note", description: ""))
                }
        }
        .environmentObject(data)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
