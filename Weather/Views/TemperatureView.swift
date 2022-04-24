//
//  TemperatureView.swift
//  Weather
//
//  Created by Apple  on 26/03/2022.
//

import SwiftUI

struct TemperatureView: View {
    
    @StateObject var vm: WeatherViewModel
    private let palette: Palette = Palette()
    let date = Date().formatted(date: .abbreviated, time: .omitted)
    
    var body: some View {
        HStack(spacing: 25) {
            VStack(alignment: .leading, spacing: 3) {
            
                if let url = vm.weather.iconUrl {
                    AsyncImage(url: url) { image in
                        image
                    } placeholder: {
                        ProgressView()
                    }

                }
                Text(vm.weather.description.uppercased())
                    .bold()
                    .font(Font.custom("Jost", size: 18))
                Text(date)
                    .font(Font.custom("Jost", size: 14))
            }
            VStack(alignment: .trailing) {
                Text(vm.weather.currentTemp)
                    .font(Font.custom("Jost", size: 70))
                    .bold()
                    .padding(.bottom, -25)
                Text("Sensación térmica: \(vm.weather.feelsLike)")
                    .font(Font.custom("Jost", size: 15))
                HStack {
                    VStack {
                        Text("Mínima")
                            .font(.system(size: 16, weight: .semibold))
                        Text(vm.weather.minTemperature)
                    }
                    VStack {
                        Text("Máxima")
                            .font(.system(size: 16, weight: .semibold))
                        Text(vm.weather.maxTemperature)
                    }
                }
                .padding(.top, 15)
            }
        }
        .padding(.horizontal)
        .frame(width: UIScreen.main.bounds.width * 0.88, height: UIScreen.main.bounds.height * 0.3, alignment: .center)
        .foregroundColor(.white)
        .background(
            LinearGradient(colors: [palette.pinkish, palette.blueish], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .cornerRadius(30)
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView(vm: WeatherViewModel())
    }
}
