//
//  WatermarkView.swift
//  Locution
//
//  Created by Pratyush  on 5/2/21.
//

import SwiftUI

struct WatermarkView: View {
    var character: String = ""
    var color: Color
    
    var body: some View {
        Text(character)
            .font(.custom("Marker Felt", size: 40.0))
            .foregroundColor(color)
            .frame(width: 44.0, height: 44.0)
            .rotation3DEffect(
                .degrees(-30),
                axis: (x: 1.0, y: 0.0, z: 0.0)
            )
            .rotationEffect(.degrees(-20))
            .shadow(color: color, radius: 20, x: 0, y: 20.0)
            .opacity(0.5)
    }
}

struct WatermarkView_Previews: PreviewProvider {
    static var previews: some View {
        WatermarkView(character: "C", color: .primary)
            
    }
}
