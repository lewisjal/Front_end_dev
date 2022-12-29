//
//  UserStruct.swift
//  Social Media
//
//  Created by M_955328 on 3/3/22.
//

import Foundation

//create overrall struct for user
struct UserModal: Decodable{
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var address: AddressModal?
    var phone: String?
    var website: String?
    var company: CompanyModal?
    
    
}

//nested JSON for address elements
struct AddressModal: Decodable{
    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?
    var geo: GeoModal?
}

// nested JSON for geographical elements
struct GeoModal: Decodable{
    var latitude: String?
    var longitude: String?
    
}

// nested JSOn for company elements
struct CompanyModal: Decodable{
    var name: String?
    var catchPhrase: String?
    var bs: String?
}
