//
//  HideKeyboard.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 17/10/2566 BE.
//

import SwiftUI

struct HideKeyboard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Done") {
                        let resign = #selector(UIResponder.resignFirstResponder)
                        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
                    }
                    
                    Spacer()
                }
            }
    }
}
