//
//  ContentView.swift
//  WeatherApp
//
//  Created by Nika Gagua on 14.05.24.
//

import SwiftUI

struct ContentView: View {
    @State var  isDayTime: Bool = true
    
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [
                isDayTime ? Color.blue : Color.black,
                isDayTime ? Color("lightBlue") : Color.gray
            ]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack (spacing: 40) {
                Text("Tbilisi")
                    .font(.system(size: 32))
                    .foregroundColor(.white)
                
                VStack(spacing: 4) {
                    Image(systemName: isDayTime ? "cloud.sun.fill" : "moon.stars")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                    
                    Text("20°")
                        .font(.system(size: 36))
                        .foregroundColor(.white)
                    
                }
                
                HStack {
                    dayWeatherContainer(dayName: "MON", imageName: "cloud.sun.fill", degreesTemperature: 20)
                    
                    dayWeatherContainer(dayName: "TUE", imageName: "sun.max.fill", degreesTemperature: 24)
                    
                    dayWeatherContainer(dayName: "WED", imageName: "wind.snow", degreesTemperature: 8)
                    
                    dayWeatherContainer(dayName: "THU", imageName: "sunset.fill", degreesTemperature: 23)
                    
                    dayWeatherContainer(dayName: "FRI", imageName: "cloud.sun.fill", degreesTemperature: 31)
                    
                    dayWeatherContainer(dayName: "SAT", imageName: "snow", degreesTemperature: 3)
                    
                    dayWeatherContainer(dayName: "SAT", imageName: "cloud.sun.fill", degreesTemperature: 37)
                }
                Spacer()
                
                Button(action: {
                    if isDayTime == true {
                        isDayTime = false
                    } else {
                        isDayTime = true
                    }
                }, label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(.white)
                        .font(.system(size: 20, weight: .bold))
                        .cornerRadius(10)
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct dayWeatherContainer: View {
    let dayName: String
    let imageName: String
    let degreesTemperature: Int
    
    var body: some View {
        VStack (spacing: 8) {
            Text(dayName)
                .font(.system(size: 20))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            
            Text("\(degreesTemperature)°")
                .font(.system(size: 20))
                .foregroundColor(.white)
        }
    }
}
