//
//  WindView.swift
//  Weather
//
//  Created by Apple  on 26/03/2022.
//

import SwiftUI

struct WindView: View {
    
    @StateObject var vm: WeatherViewModel
    let blueish = Color(red: 0.33, green: 0.39, blue: 0.94)
    let pinkish = Color(red: 0.87, green: 0.38, blue: 0.90)
    
    var body: some View {
        VStack(spacing: -10) {
            HStack(alignment: .center, spacing: 0) {
                Spacer()
                Image(systemName: "humidity")
                    .foregroundColor(blueish)
                    .padding(.trailing, 7)
                VStack {
                    Text("Humedad")
                        .font(.system(size: 18, weight: .semibold))
                    Text(vm.weather.humidity)
                }
                Spacer()
                Image(systemName: "wind")
                    .foregroundColor(blueish)
                    .padding(.trailing, 7)
                VStack {
                    Text("Viento")
                        .font(.system(size: 18, weight: .semibold))
                    Text(vm.weather.wind)
                }
                .padding(.trailing, 20)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(width: UIScreen.main.bounds.width * 0.7, height: UIScreen.main.bounds.height * 0.12, alignment: .center)
        .background(Color.white)
        .cornerRadius(30)
    }
}

struct WindView_Previews: PreviewProvider {
    static var previews: some View {
        WindView(vm: WeatherViewModel())
    }
}
