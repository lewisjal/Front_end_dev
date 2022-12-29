//
//  ContentView.swift
//  NotesApp
//
//  Created by M_955328 on 3/22/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var showImagePicker: Bool = false
    @StateObject var imageData = ImageData()
    
    var body: some View {
        NavigationView{
            VStack{
                if imageData.imageNotes.isEmpty {
                    Text("Try adding a note!")
                        .italic()
                        .foregroundColor(.gray)
                }else{
                    HomeView()
                }
            }.navigationTitle("Notes")
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(sourceType: .photoLibrary) { image in
                        imageData.addNote(image: image, title: "Edit Me!", description: "")
                        print("\(image.scale)")
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button{
                            showImagePicker.toggle()
                        }label:{
                            Label("Image", systemImage: "plus")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button{
                            withAnimation {
                                imageData.resetUserData()
                            }
                        }label:{
                            Label("Trash", systemImage: "trash")
                        }.tint(.red)
                    }
                }
        }
        .environmentObject(imageData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
