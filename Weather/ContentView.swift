//
//  ContentView.swift
//  Weather
//
//  Created by junior leoncio on 25/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Rio de Janeiro, RJ")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 30)
                
                HStack(spacing: 20) {
                    
                    WeatherViewDay(dayOfWeek: "SAT",
                                   imageName: "cloud.sun.fill",
                                   temperature: 30)
                    
                    WeatherViewDay(dayOfWeek: "SUN",
                                   imageName: "sun.max.fill",
                                   temperature: 34)
                    
                    WeatherViewDay(dayOfWeek: "MON",
                                   imageName: "cloud.sun.fill",
                                   temperature: 29)
                    
                    WeatherViewDay(dayOfWeek: "TUE",
                                   imageName: "cloud.sleet.fill",
                                   temperature: 27)
                    
                    WeatherViewDay(dayOfWeek: "WED",
                                   imageName: "cloud.bolt.fill",
                                   temperature: 26)
                }
                
                Spacer()
                
                Button { isNight.toggle()} label: {
                    WeatherButton(title: "Change Day Time", backgroundColor: .white, textColor: .blue)
                    
                }
                
                Spacer()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherViewDay: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
            VStack {
                Text(dayOfWeek)
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .foregroundColor(.white)
                
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                
                Text("\(temperature)º")
                    .font(.system(size: 28, weight: .medium))
                    .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading,
            endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}


struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)º")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
                
        }
        .padding(.bottom, 40)
    }
}

