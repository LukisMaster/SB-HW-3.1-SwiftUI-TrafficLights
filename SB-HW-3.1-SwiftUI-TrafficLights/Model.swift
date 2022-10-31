//
//  Model.swift
//  SB-HW-3.1-SwiftUI-TrafficLights
//
//  Created by Sergey Nestroyniy on 01.11.2022.
//

enum TrafficLightState: Double {
    case light = 0.0
    case dark = 0.3
    
    mutating func switchLight() {
        switch self {
        case .light: self = .dark
        case .dark: self = .light
        }
    }
}

enum TrafficLightColor {
    case red
    case yellow
    case green
    
    mutating func nextLight () {
        switch self {
        case .red: self = .yellow
        case .yellow: self = .green
        case .green: self = .red
        }
    }
}
