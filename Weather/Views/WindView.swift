//
//  WindView.swift
//  Weather
//
//  Created by Apple  on 26/03/2022.
//

import SwiftUI

struct WindView: View {
    
    @StateObject var vm: WeatherViewModel
    private let palette: Palette = Palette()
    
    var body: some View {
        VStack(spacing: -10) {
            HStack(alignment: .center, spacing: 0) {
                Spacer()
                Image(systemName: "humidity")
                    .foregroundColor(palette.blueish)
                    .padding(.trailing, 7)
                VStack {
                    Text("Humedad")
                        .font(.system(size: 18, weight: .semibold))
                    Text(vm.weather.humidity)
                }
                Spacer()
                Image(systemName: "wind")
                    .foregroundColor(palette.blueish)
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
