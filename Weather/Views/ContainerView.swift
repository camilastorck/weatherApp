//
//  ContainerView.swift
//  Weather
//
//  Created by Apple  on 25/03/2022.
//

import SwiftUI
import CoreLocationUI
import CoreLocation

struct ContainerView: View {
    
    @StateObject var vm = WeatherViewModel()
    @StateObject var vmPlace = PlaceViewModel()
    private let palette = Palette()
    @State var newCity = ""
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                TextField("Ciudad", text: $newCity)
                Button("Buscar") {
                    Task {
                        await vmPlace.getPlace(city: newCity)
                        await vm.getWeather(place: vmPlace.place.first ?? .empty)
                        
                        DispatchQueue.main.async {
                            newCity = ""
                        }
                    }
                }
                .foregroundColor(palette.blueish)
            }
            .padding(.horizontal)
            .frame(width: UIScreen.main.bounds.width * 0.6, height: 45, alignment: .center)
            .background(.white)
            .cornerRadius(12)
            
            TitleView(vm: vm)
            TemperatureView(vm: vm)
            WindView(vm: vm)
            SunsetSunriseView(vm: vm)
            
            LocationButton(.currentLocation) {
                vm.manager.requestLocation()
                
                if let currentLocation = vm.userLocation {
                    Task {
                        await vm.getWeather(place: currentLocation)
                    }
                }
            }
            .font(.caption)
            .foregroundColor(.white)
            .tint(palette.blueish)
            .cornerRadius(7)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(palette.back)
        .font(Font.custom("Jost", size: 20))
    
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
