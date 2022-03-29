//
//  WeatherFormatModel.swift
//  Weather
//
//  Created by Apple  on 26/03/2022.
//

import Foundation

struct WeatherFormat {
    let city: String
    let weather: String
    let description: String
    let iconUrl: URL?
    let currentTemp: String
    let feelsLike: String
    let minTemperature: String
    let maxTemperature: String
    let humidity: String
    let wind: String
    let sunrise: Date
    let sunset: Date
    
    static let empty: WeatherFormat = WeatherFormat(city: "Sin datos", weather: "Sin clima", description: "Sin descripción", iconUrl: nil, currentTemp: "0°C", feelsLike: "0°C", minTemperature: "0°C", maxTemperature: "0°C", humidity: "0%", wind: "0", sunrise: .now, sunset: .now)
}


