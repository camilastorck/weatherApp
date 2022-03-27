//
//  WeatherModel.swift
//  Weather
//
//  Created by Apple  on 26/03/2022.


import Foundation

struct WeatherResponseModel: Codable {
    let city: String
    let weather: [Weather]
    let temperature: Temperature
    let wind: Wind
    
    enum CodingKeys: String, CodingKey {
        case city = "name"
        case weather
        case temperature = "main"
        case wind
    }
}

struct Weather: Codable {
    let main: String
    let desc: String
    let iconUrl: String
    
    enum CodingKeys: String, CodingKey {
        case main
        case desc = "description"
        case iconUrl = "icon"
    }
}

struct Temperature: Codable {
    let currentTemperature: Double
    let feelsLike: Double
    let minTemperature: Double
    let maxTemperature: Double
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case currentTemperature = "temp"
        case feelsLike = "feels_like"
        case minTemperature = "temp_min"
        case maxTemperature = "temp_max"
        case humidity
    }
}

struct Wind: Codable {
    let speed: Double
}
