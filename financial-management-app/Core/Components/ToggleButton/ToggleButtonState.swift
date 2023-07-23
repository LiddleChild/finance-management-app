//
//  ToggleButtonState.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 23/7/2566 BE.
//

import SwiftUI

struct ToggleButtonState {
    var Label: String
    var ActiveColor: Color?
}

extension ToggleButtonState {
    static let DUMMY: [ToggleButtonState] = [
        ToggleButtonState(Label: "GREEN", ActiveColor: .green),
        ToggleButtonState(Label: "RED", ActiveColor: .red),
    ]
}
