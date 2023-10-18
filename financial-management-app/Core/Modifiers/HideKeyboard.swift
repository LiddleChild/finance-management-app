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
                    Spacer()
                    
                    Button("Done") {
                        let resign = #selector(UIResponder.resignFirstResponder)
                        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
                    }
                    .font(.system(size: 16))
                    .foregroundColor(Color.color5)
                }
            }
    }
}
