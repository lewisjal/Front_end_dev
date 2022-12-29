//
//  ImageDataModel.swift
//  NotesApp
//
//  Created by M_955328 on 3/22/22.
//

import Foundation
import UIKit
import SwiftUI

struct Note: Codable, Hashable, Identifiable{
    var id = UUID()
    var title: String
    var description: String
}

@MainActor class NoteData: ObservableObject{
    private let NOTE_KEY =  "NoteKey"
    var newNote: [Note]{
        didSet {
            objectWillChange.send()
        }
    }
    
    init(){
        if let data = UserDefaults.standard.data(forKey: NOTE_KEY){
            if let decodedNotes = try? JSONDecoder().decode([Note].self, from: data){
                newNote = decodedNotes
                print("Note data successfuly retrieved!")
                return
            }
        }
        newNote = []
    }
    
    func addNote(title: String, description: String){
             let tempNote = Note(title: title, description: description)
                newNote.insert(tempNote, at: 0)
                print("Note Added")
                saveData()
    }
    
    func editNote(id: UUID, title: String, description: String){
        if let note = newNote.first(where: {$0.id == id}){
            let index = newNote.firstIndex(of: note)
            
            newNote[index!].title = title
            newNote[index!].description = description
        }
        
    }
    
    private func saveData(){
        if let encodedNotes = try? JSONEncoder().encode(newNote){
            UserDefaults.standard.set(encodedNotes, forKey: NOTE_KEY)
        }
    }
    
    func resetUserData(){
        UserDefaults.standard.removeObject(forKey: NOTE_KEY)
        UserDefaults.resetStandardUserDefaults()
        
        newNote = []
    }
}
