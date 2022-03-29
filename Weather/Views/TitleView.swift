//
//  TitleView.swift
//  Weather
//
//  Created by Apple  on 26/03/2022.
//

import SwiftUI

struct TitleView: View {
    
    @StateObject var vm: WeatherViewModel
    let blueish = Color(red: 0.33, green: 0.39, blue: 0.94)
    
    var body: some View {
        VStack(spacing: 6) {
            HStack {
                Image(systemName: "paperplane.circle.fill")
                    .foregroundColor(blueish)
                Text(vm.weather.city)
                    .font(.title2)
                    .bold()
                    .kerning(1.5)
            }
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(vm: WeatherViewModel())
    }
}
