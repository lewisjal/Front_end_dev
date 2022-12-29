//
//  NoteDetailView.swift
//  NotesApp
//
//  Created by M_955328 on 3/22/22.
//

import SwiftUI

struct NoteDetailView: View {
    @EnvironmentObject var imageData : NoteData
    @State var note: Note
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Form{
            Section{
                TextField("Edit me!", text: $note.title)
                    .textSelection(.enabled)
                    .onTapGesture {
                        note.title = ""
                    }
                ZStack{
                    TextEditor(text: $note.description)
                        .textSelection(.enabled)
                        .frame(height: 300)
                }
                HStack{
                    Spacer()
                    Button("Confirm Changes"){
                        imageData.editNote(id: note.id, title: note.title, description: note.description)
                        presentationMode.wrappedValue.dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}

struct NoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetailView(note: Note(id: UUID(), title: "Test", description: "Test description")).environmentObject(NoteData())
    }
}
