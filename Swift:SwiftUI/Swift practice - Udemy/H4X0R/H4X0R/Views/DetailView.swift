//
//  DetailView.swift
//  H4X0R
//
//  Created by M_955328 on 9/13/22.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://google.com" )
    }
}


