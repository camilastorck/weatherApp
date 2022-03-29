//
//  PlacemODEL.swift
//  Weather
//
//  Created by Apple  on 28/03/2022.
//

import Foundation

struct Place: Codable {
    let lat: Double
    let lon: Double
    
    static let empty: Place = Place(lat: -37.5486, lon: -62.7717)
}
