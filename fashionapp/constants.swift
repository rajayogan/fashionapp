//
//  constants.swift
//  fashionapp
//
//  Created by Rajayogan on 05/05/25.
//

import Foundation
import SwiftUI

//Font Helper
extension Font {
    static func opensans(fontStyle: Font.TextStyle = .body, fontWeight: Weight = .regular, fontSize: CGFloat = 16) -> Font {
        return Font.custom(OpenSansFont(weight: fontWeight).rawValue, size: fontSize)
    }
    
    static func exo2(fontStyle: Font.TextStyle = .body, fontWeight: Weight = .regular, fontSize: CGFloat = 16) -> Font {
        return Font.custom(Exo2Font(weight: fontWeight).rawValue, size: fontSize)
    }
}

enum OpenSansFont: String {
    case regular = "OpenSans-Regular"
    case semibold = "OpenSans-SemiBold"
    case bold = "OpenSans-Bold"
    case light = "OpenSans-Light"
    case medium = "OpenSans-Medium"
    
    //Note - Ensure all fonts are actually there in the fonts directory
    
    init(weight: Font.Weight) {
        switch weight {
        case .regular:
            self = .regular
        case .semibold:
            self = .semibold
        case .bold:
            self = .bold
        case .light:
            self = .light
        case .medium:
            self = .medium
        default:
            self = .regular
        }
    }
}

//Exo2
enum Exo2Font: String {
    case regular = "Exo2-Regular"
    case semibold = "Exo2-SemiBold"
    case bold = "Exo2-Bold"
    case light = "Exo2-Light"
    case medium = "Exo2-Medium"
    
    //Note - Ensure all fonts are actually there in the fonts directory
    
    init(weight: Font.Weight) {
        switch weight {
        case .regular:
            self = .regular
        case .semibold:
            self = .semibold
        case .bold:
            self = .bold
        case .light:
            self = .light
        case .medium:
            self = .medium
        default:
            self = .regular
        }
    }
}
