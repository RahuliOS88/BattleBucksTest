//
//  ColorExtension.swift
//  BattleBucksDemo
//
//  Created by Rahul Gupta on 27/09/24.
//

import SwiftUI

extension Color {
    static let customDarkGray = Color(hex: "#F7F7F7")
    static let customLightGray = Color(hex: "#F1F1F1")
}

// Utility extension to initialize Color from hexadecimal value
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let r = Double((int >> 16) & 0xFF) / 255.0
        let g = Double((int >> 8) & 0xFF) / 255.0
        let b = Double(int & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}


