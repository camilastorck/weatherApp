//
//  Mapper.swift
//  Weather
//
//  Created by Apple  on 26/03/2022.
//

import Foundation

struct Mapper {
    
    func weatherModelToFormat(model: WeatherResponseModel) -> WeatherFormat {
        
        guard let weather = model.weather.first else { return .empty }
        let temperature = model.temperature
        let wind = model.wind
        //let sun = model.sun
        let sunriseWithTimezone = model.sun.sunrise.addingTimeInterval(model.timezone - Double(TimeZone.current.secondsFromGMT()))
        let sunsetWithTimezone = model.sun.sunset.addingTimeInterval(model.timezone - Double(TimeZone.current.secondsFromGMT()))
        
        return WeatherFormat(city: model.city,
                             weather: weather.main,
                             description: weather.desc,
                             iconUrl: URL(string: "https:openweathermap.org/img/wn/\(weather.iconUrl)@2x.png"),
                             currentTemp: "\(Int(temperature.currentTemperature))°C",
                             feelsLike: "\(Int(temperature.feelsLike))°C",
                             minTemperature: "\(Int(temperature.minTemperature))°C",
                             maxTemperature: "\(Int(temperature.maxTemperature))°C",
                             humidity: "\(Int(temperature.humidity))%",
                             wind: "\(Int(wind.speed)) m/s.",
                             sunrise: sunriseWithTimezone,
                             sunset: sunsetWithTimezone)
    }
}
