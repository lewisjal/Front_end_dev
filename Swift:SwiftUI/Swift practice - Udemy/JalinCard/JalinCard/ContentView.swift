//
//  ContentView.swift
//  JalinCard
//
//  Created by M_955328 on 6/20/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.09, green: 0.63, blue: 0.52)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("Profile")
                    .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                Text("Jalin Lewis")
                    .font(.title)
                    .bold()
                    .font(.system(size: 40))
                .foregroundColor(.white)
                Text("iOS Developer")
                    .foregroundColor(Color.white)
                    .font(.subheadline)
                    .font(.system(size: 25))
                Divider()
                InfoView(text: "+1 (313)980-5228", imageName: "phone.fill", color: .green)
                InfoView(text: "jalinlew@yahoo.com", imageName: "envelope.badge.fill", color: .green)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


