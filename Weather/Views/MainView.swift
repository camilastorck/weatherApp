//
//  MainView.swift
//  Weather
//
//  Created by Apple  on 25/03/2022.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var vm = WeatherViewModel()
    @StateObject var vmPlace = PlaceViewModel()
    @State var newCity = ""
    
    let back = Color(red: 0.95, green: 0.91, blue: 0.96)
    let blueish = Color(red: 0.33, green: 0.39, blue: 0.94)
    let pinkish = Color(red: 0.87, green: 0.38, blue: 0.90)
    
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
                .foregroundColor(blueish)
            }
            .padding(.horizontal)
            .frame(width: UIScreen.main.bounds.width * 0.6, height: 45, alignment: .center)
            .background(.white)
            .cornerRadius(20)
            
            TitleView(vm: vm)
            TemperatureView(vm: vm)
            WindView(vm: vm)
            SunsetSunriseView(vm: vm)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(back)
        .font(Font.custom("Jost", size: 20))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
