//
//  TrafficLightCircle.swift
//  SB-HW-3.1-SwiftUI-TrafficLights
//
//  Created by Sergey Nestroyniy on 31.10.2022.
//

import SwiftUI

struct TrafficLightCircle: View {
    
    let state: TrafficLightState
    let color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(color)
                .overlay(Circle().stroke(.white, lineWidth: 5))
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(.black.opacity(state.rawValue))
                .overlay(Circle().stroke(.white, lineWidth: 5))
        }
    }
    
}

struct TrafficLightCircle_Previews: PreviewProvider {
    static var previews: some View {
        TrafficLightCircle(state: .dark,color: .red)
    }
}
