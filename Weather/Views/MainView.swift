//
//  MainView.swift
//  Weather
//
//  Created by Apple  on 25/03/2022.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var vm = WeatherViewModel()
    let back = Color(red: 0.95, green: 0.91, blue: 0.96)
    
    var body: some View {
        VStack(spacing: 30) {
            
            TitleView(vm: vm)
            TemperatureView(vm: vm)
            WindView(vm: vm)
            SunsetSunriseView(vm: vm)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(back)
        .font(Font.custom("Jost", size: 20))
        
        .task {
            await vm.getWeather(lat: -38.71959, lon: -62.27243)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainView()
                //.previewDevice("iPad mini (6th generation)")
        }
    }
}
