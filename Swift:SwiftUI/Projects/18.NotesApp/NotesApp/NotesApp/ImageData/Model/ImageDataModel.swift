//
//  ImageDataModel.swift
//  NotesApp
//
//  Created by M_955328 on 3/22/22.
//

import Foundation
import UIKit
import SwiftUI

struct ImageNote: Codable, Hashable, Identifiable{
    var id = UUID()
    var image: Data
    var title: String
    var description: String
    
    
}

@MainActor class ImageData: ObservableObject{
    private let IMAGES_KEY =  "ImagesKey"
    var imageNotes: [ImageNote]{
        didSet {
            objectWillChange.send()
        }
    }
    
    init(){
        if let data = UserDefaults.standard.data(forKey: IMAGES_KEY){
            if let decodedNotes = try? JSONDecoder().decode([ImageNote].self, from: data){
                imageNotes = decodedNotes
                print("Note data successfuly retrieved!")
                return
            }
        }
        imageNotes = []
    }
    
    func addNote(image: UIImage, title: String, description: String){
        if let pngRepresentation = image.pngData() {
            let tempNote = ImageNote(image: pngRepresentation, title: title, description: description)
            imageNotes.insert(tempNote, at: 0)
            print("Note Added")
            saveData()
        }
    }
    
    func editNote(id: UUID, title: String, description: String){
        if let note = imageNotes.first(where: {$0.id == id}){
            let index = imageNotes.firstIndex(of: note)
            
            imageNotes[index!].title = title
            imageNotes[index!].description = description
        }
        
    }
    
    private func saveData(){
        if let encodedNotes = try? JSONEncoder().encode(imageNotes){
            UserDefaults.standard.set(encodedNotes, forKey: IMAGES_KEY)
        }
    }
    
    func resetUserData(){
        UserDefaults.standard.removeObject(forKey: IMAGES_KEY)
        UserDefaults.resetStandardUserDefaults()
        
        imageNotes = []
    }
}
