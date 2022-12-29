//
//  NewNoteView.swift
//  NotesApp
//
//  Created by M_955328 on 3/23/22.
//

import SwiftUI

struct NewNoteView: View {
    @EnvironmentObject var imageData: NoteData
    @State var note: Note
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form{
            Section{
                TextField("New note", text: $note.title)
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
                        imageData.addNote(title: note.title, description: note.description)
                        presentationMode.wrappedValue.dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteView(note: Note(id: UUID(), title: "New Note", description: ""))
    }
}
