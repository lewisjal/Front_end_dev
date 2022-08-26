//
//  WeatherModel.swift
//  Clima
//
//  Created by M_955328 on 5/3/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    
    let conditionID: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
        switch conditionID {
        case 0...299:
            return "cloud.bolt.rain"
        case 300...400:
            return "cloud.drizzle"
        case 500...599:
            return "cloud.rain"
        case 600...699:
            return "snowflake"
        case 741:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...899:
            return "cloud"
        default:
            print("error loading condition")
        }
        return "Error in function"
    }
    
}
