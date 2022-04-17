//
//  PlaceModel.swift
//  Weather
//
//  Created by Apple  on 28/03/2022.
//

import Foundation

struct Place: Codable {
    let name: String
    let lat: Double
    let lon: Double
    
    static let empty: Place = Place(name: "Buenos Aires", lat: -34.6083, lon: -58.3712)
}
