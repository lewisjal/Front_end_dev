//
//  SearchView.swift
//  ShoppingApp
//
//  Created by M_955328 on 3/31/22.
//

import SwiftUI

struct SearchView: View {
    
    var animation: Namespace.ID
    
    @EnvironmentObject var homeData: HomeViewModel
    
    //Activating Text Field with help of FocusState
    @FocusState var startTF: Bool
    
    var body: some View {
        VStack(spacing: 0){
            //Formatting and fucntionality of the search bar
            HStack(spacing:20){
                
                //the close button
                Button {
                    withAnimation {
                        homeData.searchActivated = false
                    }
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(Color.black.opacity(0.7))
                }
                //Search bar
                HStack(spacing: 15) {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                    //WIll need to create a seperate view for search bar
                    TextField("Search", text: $homeData.searchText)
                        .focused($startTF)
                        .foregroundColor(.gray)
                        .textCase(.lowercase)
                        .disableAutocorrection(true)
                }
                .padding(.vertical,12)
                .padding(.horizontal)
                .background(
                    Capsule().strokeBorder(Color.orange, lineWidth: 1.5)
                )
                .matchedGeometryEffect(id: "SEARCHBAR", in: animation)
                .padding(.trailing, 20)
            }
            .padding([.horizontal])
            .padding(.top)
            
            //Filtering results in search
            ScrollView(.vertical, showsIndicators: false){
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.1, saturation: 0.022, brightness: 0.947)/*@END_MENU_TOKEN@*/.ignoresSafeArea())
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                startTF = true
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        ProductPage()
    }
}
