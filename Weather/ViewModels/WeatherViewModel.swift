//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Apple  on 26/03/2022.
//

import Foundation

final class WeatherViewModel: ObservableObject {
    
    @Published var weather: WeatherFormat = .empty
    private let mapper: Mapper = Mapper()
    private let key = "e138bdccfe8ee4cddfda71ab4fe1c722"
    
    func getWeather(place: Place) async {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(place.lat)&lon=\(place.lon)&appid=\(key)&units=metric&lang=es") else { return }
        
        do {
            async let (data, _) = try await URLSession.shared.data(from: url)
            let dataModel = try await JSONDecoder().decode(WeatherResponseModel.self, from: data)
            
            DispatchQueue.main.async {
                self.weather = self.mapper.weatherModelToFormat(model: dataModel)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
