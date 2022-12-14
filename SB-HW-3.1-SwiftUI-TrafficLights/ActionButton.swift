//
//  ActionButton.swift
//  SB-HW-3.1-SwiftUI-TrafficLights
//
//  Created by Sergey Nestroyniy on 01.11.2022.
//

import SwiftUI

struct ActionButton: View {
    
    let text : String
    let action : () -> ()
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Capsule(style: .continuous)
                    .frame(width: 150, height: 50)
                    .overlay(Capsule()
                        .stroke(.white, lineWidth: 5))
                Text(text)
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(text: "Start", action: {})
    }
}
