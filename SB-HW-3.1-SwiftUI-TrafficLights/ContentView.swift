//
//  ContentView.swift
//  SB-HW-3.1-SwiftUI-TrafficLights
//
//  Created by Sergey Nestroyniy on 31.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            Color(.gray)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                TrafficLightCircle(state: redLight, color: .red)
                TrafficLightCircle(state: yellowLight, color: .yellow)
                TrafficLightCircle(state: greenLight, color: .green)
                Spacer()
                Button(action: nextStepTrafficLight) {
                    ZStack {
                        Capsule(style: .continuous)
                            .frame(width: 150, height: 50, alignment: .center)
                            .overlay(Capsule().stroke(.white, lineWidth: 5))
                        Text(buttonText)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                }

            }
            .padding()
        }
    }
    
    @State private var buttonText = "Start"
    @State private var trafficColor: TrafficLightColor? 
    @State private var redLight = TrafficLightState.dark
    @State private var yellowLight = TrafficLightState.dark
    @State private var greenLight = TrafficLightState.dark
    
    private func nextStepTrafficLight() {
        if trafficColor != nil {
            switchLight()
        } else {
            buttonText = "Next"
            trafficColor = .red
            redLight = .light
        }
    }
    
    private func switchLight () {
        switch trafficColor {
        case .red :
            redLight.switchLight()
            yellowLight.switchLight()
        case .yellow :
            yellowLight.switchLight()
            greenLight.switchLight()
        case .green :
            greenLight.switchLight()
            redLight.switchLight()
        case .none:
            break
        }
        trafficColor?.nextLight()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
