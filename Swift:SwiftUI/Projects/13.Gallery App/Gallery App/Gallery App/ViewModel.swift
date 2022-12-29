//
//  ViewModel.swift
//  Gallery App
//
//  Created by M_955328 on 3/14/22.
//

import Foundation
class LoadPictures {
    
    var model = [Model]()
    
    func loadPictures(){
    model.append(Model(text: "Mountain Trip", imagaeName: "landscape_mountains_sun_"))
    model.append(Model(text: "Train", imagaeName: "Nature-Train"))
    model.append(Model(text: "Nature Trip", imagaeName: "Nature"))
    model.append(Model(text: "Paris", imagaeName: "Paris"))
    }
}
