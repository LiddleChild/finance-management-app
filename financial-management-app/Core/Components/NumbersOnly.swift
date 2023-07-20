//
//  NumbersOnly.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 20/7/2566 BE.
//

import Foundation
import SwiftUI

class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber || $0 == "." || $0 == "," }
            let numberOfDots = value.reduce(0) { $1 == "." ? $0 + 1 : $0 }

            if value != filtered {
                value = filtered
            }
            
            if numberOfDots > 1 {
                value = String(value.dropLast())
            }
        }
    }
}
