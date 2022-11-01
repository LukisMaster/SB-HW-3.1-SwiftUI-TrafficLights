//
//  ContentView.swift
//  SB-HW-3.1-SwiftUI-TrafficLights
//
//  Created by Sergey Nestroyniy on 31.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    private enum TrafficLightColor {
        case none
        case red
        case yellow
        case green
        
        mutating func nextLight () {
            switch self {
            case .red:
                self = .yellow
            case .yellow:
                self = .green
            case .none:
                fallthrough
            case .green:
                self = .red
            }
        }
    }
    
    @State private var buttonText = "Start"
    @State private var currentTrafficColor = TrafficLightColor.none

    private let dark = 0.4
    private let light = 0.0
    
    private func nextStepTrafficLight() {
        currentTrafficColor.nextLight()
        if currentTrafficColor == .none {
            buttonText = "Next"
        }
    }
}

// MARK: Body

extension ContentView {
    var body: some View {
        ZStack {
            Color(hue: 0.9, saturation: 0.2, brightness: 0.05, opacity: 0.97)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                TrafficLightCircle(blackOut: currentTrafficColor == .red ? light : dark, color: .red)
                TrafficLightCircle(blackOut: currentTrafficColor == .yellow ? light : dark, color: .yellow)
                TrafficLightCircle(blackOut: currentTrafficColor == .green ? light : dark, color: .green)
                Spacer()
                ActionButton(text: buttonText, action: nextStepTrafficLight)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
