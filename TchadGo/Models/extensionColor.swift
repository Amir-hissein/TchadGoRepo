//
//  extensionColor.swift
//  TchadGo
//
//  Created by Amir hissein on 29.06.2025.
//

import Foundation
import SwiftUICore
extension Color {
    init(hex: String) {
        var hexString = hex
        if hexString.hasPrefix("#") {
            hexString.removeFirst()
        }
        var rgb: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
}
