//
//  ContentView.swift
//  ResumeSwiftUI
//
//  Created by M_955328 on 3/16/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            HStack() {
                Text("Name")
                Spacer()
                
                Text(":")
                Spacer()
                
                Text("Jalin Lewis")
                
            }.padding(25)
                .position(x: 150, y: 40)
                
            HStack {
                Text("Education")
                Spacer()
                
                Text(":")
                Spacer()
                
                Text("Mathematics")
            }.padding(25).position(x: 150, y: 30)
            HStack {
                Text("Hobbies")
                Spacer()
                
                Text(":")
                Spacer()
                
                VStack {
                    Text("Gym")
                    Text("Food")
                    Text("Movies")
                }
            }.padding(25).position(x: 150, y: 30)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
