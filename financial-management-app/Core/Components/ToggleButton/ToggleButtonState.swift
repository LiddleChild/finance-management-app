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
    static let DUMMY_GREEN = ToggleButtonState(Label: "GREEN", ActiveColor: .green)
    static let DUMMY_RED = ToggleButtonState(Label: "RED", ActiveColor: .red)
}
