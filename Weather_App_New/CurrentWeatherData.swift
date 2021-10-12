//
//  CurrentWeatherData.swift
//  Weather_App_New
//
//  Created by Максим Гаврилюк on 12.10.2021.
//

import Foundation



struct CurrentWeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]




}

struct Main: Decodable {
    let temp: Double
    let feelsLike: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
    }
}


struct Weather: Decodable {
    let id: Int
    
}
