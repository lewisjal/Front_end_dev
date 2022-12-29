//
//  Staggered.swift
//  StaggeredGrid
//
//  Created by M_955328 on 3/31/22.
//

import SwiftUI

//Custom view builder

//T is to hold the identifiable collection of data
struct Staggered<Content: View, T: Identifiable>: View where T: Hashable{
    var content: (T) -> Content
    
    var list: [T]
    
    //Columns
    var columns: Int
    
    //Properties...
    var showsIndicators: Bool
    var spacing: CGFloat
    
    init(columns: Int, showsIndicators: Bool = false, spacing: CGFloat = 10, list: [T], @ViewBuilder content: @escaping (T) -> Content){
        self.content = content
        self.list = list
        self.spacing = spacing
        self.showsIndicators = showsIndicators
        self.columns = columns
    }
    
    //Staggered Grid Function
    func setUpList()->[[T]]{
        
        //creating empty sub arrays of columns count
        var gridArray: [[T]] = Array(repeating: [], count: columns)
        
        //splitting array fro VStack oriented View
        var currentIndex: Int = 0
        
        for object in list{
            gridArray[currentIndex].append(object)
            
            //increasing index count
            //and resetting if overbounds the column count
            if currentIndex == (columns - 1){
                currentIndex = 0
            }else{
                currentIndex += 1
            }
        }
        
        return gridArray
    }
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: showsIndicators) {
            HStack(alignment: .top){
                
                ForEach(setUpList(), id:\.self){columnsData in
                    //For optimized using LazyStack
                    LazyVStack(spacing: spacing){
                        
                        ForEach(columnsData){object in
                            content(object)
                        }
                    }
                }
            }
            //only vertical padding..
            //horizontal padding will be user's option
            .padding(.vertical)
        }
    }
}

struct Staggered_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
