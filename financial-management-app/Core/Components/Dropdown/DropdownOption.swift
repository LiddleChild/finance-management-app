//
//  DropdownOption.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 21/7/2566 BE.
//

import SwiftUI

struct DropdownOption {
    var OptionId: String = UUID().uuidString
    var Label: String
    var Color: Color?
    var Image: String?
}

extension DropdownOption {
    static let DUMMY: [DropdownOption] = [
        DropdownOption(Label: "Option 1"),
        DropdownOption(Label: "Red", Color: .red),
        DropdownOption(Label: "Green", Color: .green),
        DropdownOption(Label: "Bus", Image: "bus.fill"),
        DropdownOption(Label: "Food", Color: .yellow, Image: "fork.knife"),
    ]
}
