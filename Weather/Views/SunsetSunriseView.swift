//
//  SunsetSunriseView.swift
//  Weather
//
//  Created by Apple  on 26/03/2022.
//

import SwiftUI

struct SunsetSunriseView: View {
    
    @StateObject var vm: WeatherViewModel
    let blueish = Color(red: 0.33, green: 0.39, blue: 0.94)
    let pinkish = Color(red: 0.87, green: 0.38, blue: 0.90)
    let gray = Color(red: 0.88, green: 0.88, blue: 0.88)
    
    var body: some View {
        VStack(spacing: -10) {
            HStack(alignment: .center, spacing: 0) {
                Spacer()
                VStack {
                    Text("5:56 A.M.")
                        .font(.system(size: 15))
                    Text("Amanecer")
                        .font(.system(size: 16, weight: .semibold))
                }
                Image(systemName: "sun.and.horizon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.25, alignment: .center)
                    .padding(.horizontal)
                    .foregroundColor(gray)
                VStack {
                    Text("19:35 P.M.")
                        .font(.system(size: 15))
                    Text("Atardecer")
                        .font(.system(size: 16, weight: .semibold))
                }
                .padding(.trailing, 10)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.12, alignment: .center)
        .background(Color.white)
        .cornerRadius(30)
    }
}


struct SunsetSunriseView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SunsetSunriseView(vm: WeatherViewModel())
        }
    }
}
