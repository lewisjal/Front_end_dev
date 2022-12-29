//
//  SearchView.swift
//  ShoppingApp
//
//  Created by M_955328 on 3/31/22.
//

import SwiftUI

struct SearchView: View {
    
    var animation: Namespace.ID
    
    //Shared Data
    @EnvironmentObject var sharedData: SharedDataModel
    
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
                    homeData.searchText = ""
                    //Restting..
                    sharedData.fromSearchPage = false
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
            .padding(.bottom, 10)
            
            //Showing progress if searching
            //else show no results found
            if let products = homeData.searchedProducts{
                if products.isEmpty{
                    Text("No results found.")
                        .padding(.top, 60)
                        .font(.system(size: 25))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 30)
                    
                }else{
                    //Filtering results in search
                    ScrollView(.vertical, showsIndicators: false){
                        VStack(spacing:0){
                            //Searched text
                            
                            Text("Found \(products.count)")
                                .font(.system(size: 24).bold())
                                .padding(.vertical)
                            
                            //Staggered Grid
                            Staggered(columns: 2, spacing: 20, list: products){ product in
                                //Card View
                                ProductCardView(product: product)
                            }
                        }
                        .padding()
                    }
                }
            }else{
                ProgressView()
                    .padding(.top, 30)
                    .opacity(homeData.searchText == "" ? 0 : 1)
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
    @ViewBuilder
    func ProductCardView(product: Product)-> some View{
        VStack(spacing: 10){
            //Adding matched geometry
            ZStack{
                if sharedData.showDetailProduct{
                    Image(product.productImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(0)
                }else{
                    Image(product.productImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "\(product.id)SEARCH", in: animation)
                }
            }
            Text(product.title)
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .padding(.top)
            Text(product.subtitle)
                .font(.system(size: 14))
                .foregroundColor(.gray)
            Text(product.price)
                .font(.system(size: 16))
                .fontWeight(.bold)
                .foregroundColor(.orange)
                .padding(.top,5)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 25)
        .background(
            Color.white.cornerRadius(15)
        )
        //Showing product detail when tapped
        .onTapGesture {
            withAnimation(.easeInOut){
                sharedData.fromSearchPage = true
                sharedData.detailProduct = product
                sharedData.showDetailProduct = true
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        ProductPage()
    }
}
