//
//  Color.swift
//  EduCloud
//
//  Created by Pratyush Sharma on 21/09/20.
//

import Foundation
import SwiftUI

struct Colors {
    
    enum Palette: String, CaseIterable {
        
        case brightLilac = "brightLilacColor"
        case languidLavender = "languidLavenderColor"
        case blizzardBlue = "blizzardBlueColor"
        case sapphireBlue = "sapphireBlueColor"
        case queenPink = "queenPinkColor"
        case indigoDye = "indigoDyeColor"
        case cadetBlue = "cadetBlueColor"
        case lightCoral = "lightCoralColor"
        case floralWhite = "floralWhiteColor"
        case ruberRed = "ruberRedColor"
        case mediumTurquoise = "mediumTurquoiseColor"
        case maximumBlue = "maximumBlueColor"
        case lavender = "lavenderColor"
        case cupid = "cupidColor"
        
        var color: Color {
            return Color(rawValue)
        }
    }
    
    var randomColor: Color {
        return Palette.allCases.randomElement()?.color ?? Colors.Palette.queenPink.color
    }
}
