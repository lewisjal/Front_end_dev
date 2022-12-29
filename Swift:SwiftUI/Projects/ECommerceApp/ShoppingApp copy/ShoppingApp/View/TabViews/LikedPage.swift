//
//  LikedProducts.swift
//  ShoppingApp
//
//  Created by M_955328 on 3/31/22.
//

import SwiftUI

struct LikedPage: View {
    //For designing
    @EnvironmentObject var sharedData: SharedDataModel
    
    //Delete option
    @State var showDeleteOption: Bool = false
    
    var body: some View {
        
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    HStack{
                        Text("Favorites")
                            .font(.system(size: 28).bold())
                        Spacer()
                        
                        Button {
                            withAnimation {
                                showDeleteOption.toggle()
                            }
                        } label: {
                            Image(systemName: "trash")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.red)
                                .frame(width: 25, height: 25)
                        }
                        .opacity(sharedData.likedProducts.isEmpty ? 0 : 1)
                    }
                    //checking if like product are empty
                    if sharedData.likedProducts.isEmpty{
                        
                        Group{
                            
                            Spacer(minLength: UIScreen.main.bounds.height / 3)
                            
                            Text("There is nothing here.\nYou should like something.")
                                .font(.system(size: 15))
                                .fontWeight(.light)
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(maxHeight: .infinity)
                        }
                    }else{
                        //Dsiplaying products
                        VStack(spacing: 15){
                            
                            //For designing
                            ForEach(sharedData.likedProducts){ product in
                                HStack(spacing: 0){
                                    if showDeleteOption{
                                        Button {
                                            deleteProduct(product: product)
                                        } label: {
                                            Image(systemName: "minus.circle.fill")
                                                .font(.title2)
                                                .foregroundColor(.red)
                                        }
                                        .padding(.trailing)

                                    }
                                    CardView(product: product)
                                }
                            }
                        }
                        .padding(.top,25)
                        .padding(.horizontal)
                    }
                    
                }
                .padding()
            }
            .navigationBarHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.092, saturation: 0.017, brightness: 0.924)/*@END_MENU_TOKEN@*/.ignoresSafeArea())
        }
    }
    
    @ViewBuilder
    func CardView(product:Product) -> some View {
        HStack(spacing:15){
            Image(product.productImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            VStack(alignment: .leading, spacing: 8) {
                Text(product.title)
                    .font(.system(size: 18).bold())
                    .lineLimit(1)
                Text(product.subtitle)
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                    .foregroundColor(.orange)
                Text("Type: \(product.type.rawValue)")
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal,10)
        .padding(.vertical)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            Color.white.cornerRadius(10)
        )
    }
    
    func deleteProduct(product: Product){
        if let index = sharedData.likedProducts.firstIndex(where: { currentProduct in
            return product.id == currentProduct.id
        }){
            let _ = withAnimation {
                //removing the products
                sharedData.likedProducts.remove(at: index)
            }
        }
    }
}

struct LikedPage_Previews: PreviewProvider {
    static var previews: some View {
        LikedPage()
            .environmentObject(SharedDataModel())
    }
}
