//
//  CustomTextfield.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 20/6/2566 BE.
//

import Foundation
import SwiftUI

struct TextfieldModifier: ViewModifier {
    var label: String
    var placeholder: String
    var text: String
    
    @FocusState private var isFocus: Bool
    
    func body(content: Content) -> some View {
        content
            .focused($isFocus)
            .focusablePadding()
            .foregroundColor(Color("color-5"))
            .background(alignment: .bottom, content: {
                ZStack(alignment: .topLeading) {
                    // Border
                    RoundedRectangle(cornerRadius: 12)
                        .strokeBorder(Color("color-\(isFocus ? 4 : 3)"))
                    
                    // Label
                    Text(label)
                        .font(.system(size: 20, weight: .regular))
                        .padding(.horizontal, 8)
                        .foregroundColor(Color("color-5"))
                        .background(Color("color-1"))
                        .offset(x: 12, y: -12)
                    
                    // Placeholder
                    if text == "" && !isFocus {
                        Text(verbatim: placeholder)
                            .font(.system(size: 16, weight: .light))
                            .foregroundColor(Color("color-3"))
                            .padding(16)
                    }
                }
            })
    }
}
