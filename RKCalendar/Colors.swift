//
//  Colors.swift
//  edujourney
//
//  Created by Aaron Augusto on 12/28/20.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }

    public static var background : Color {
        return Color.init(hex: "DCDCDC")
    }
    
    public static var grayBorder : Color {
        return Color.init(hex: "bbbbbb")
    }
    
    public static var cardBackground : Color {
        return Color.init(hex: "eaeaea")
    }
     
    public static var lightBackground : Color {
        return Color.init(hex: "f2f2f2")
    }
    
    public static var textFieldBackground : Color {
       return Color.init(hex: "f2f2f2")
    }
    
    public static var buttonBackground : Color {
        return Color.init(hex: "8602FF")
    }
    
    public static var indexViewButtonsBackground : Color {
        return Color.init(hex: "FAF6F3")
    }
    
    public static var subscriptionViewDropdownBackground : Color {
        return Color.init(hex: "f3f3f3")
    }
    
    public static var calendarDateRangeBackground : Color {
        return Color.init(hex: "f7f7f7")
    }
    
    public static var errorMessageTextColor : Color {
        return Color.init(hex: "C40909")
    }
     
}
