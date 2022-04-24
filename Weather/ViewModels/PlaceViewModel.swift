//
//  PlaceViewModel.swift
//  Weather
//
//  Created by Apple  on 28/03/2022.
//

import Foundation


class PlaceViewModel: ObservableObject {
    
    @Published var place: [Place] = [.empty]
    private let key = "e138bdccfe8ee4cddfda71ab4fe1c722"

    func getPlace(city: String) async {
        
        guard let url = URL(string: "https://api.openweathermap.org/geo/1.0/direct?q=\(city)&limit=4&appid=\(key)") else { return }
        
        do {
            async let (data, _) = try await URLSession.shared.data(from: url)
            let dataModel = try await JSONDecoder().decode(Array<Place>.self, from: data)
            
            DispatchQueue.main.async {
                self.place = dataModel
                print(dataModel)
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
