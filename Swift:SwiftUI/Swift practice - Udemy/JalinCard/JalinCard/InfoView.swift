//
//  InfoView.swift
//  JalinCard
//
//  Created by M_955328 on 9/8/22.
//

import SwiftUI

struct InfoView: View {
    
    let text: String
    let imageName: String
    let color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 50)
            .overlay(HStack {
                Image(systemName: imageName)
                    .foregroundColor(color)
                Text(text)
            })
            .padding()
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "love", imageName: "phone.fill", color: .blue)
            .previewLayout(.sizeThatFits)
    }
}
