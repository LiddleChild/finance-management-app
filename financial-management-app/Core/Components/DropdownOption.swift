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
}

extension DropdownOption {
    static let DUMMY: [DropdownOption] = [
        DropdownOption(Label: "Red", Color: .red),
        DropdownOption(Label: "Green", Color: .green),
        DropdownOption(Label: "Blue", Color: .blue),
        DropdownOption(Label: "Cyan", Color: .cyan),
    ]
}
