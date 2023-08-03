//
//  ColorExtension.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 25/6/2566 BE.
//

import SwiftUI

extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
    
    func toHex() -> Int {
        guard let cg = self.cgColor else { return 0 }
        
        let r = Int(cg.components![0] * 255.0)
        let g = Int(cg.components![1] * 255.0)
        let b = Int(cg.components![2] * 255.0)
        
        return r << 16 | g << 8 | b
    }
    
    static let color1 = Color("color-1")
    static let color2 = Color("color-2")
    static let color3 = Color("color-3")
    static let color4 = Color("color-4")
    static let color5 = Color("color-5")
}
