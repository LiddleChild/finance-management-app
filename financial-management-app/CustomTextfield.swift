//
//  CustomTextfield.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 20/6/2566 BE.
//

import Foundation
import SwiftUI

struct CustomTextField: View {
    var label: String
    var placeholder: String
    @Binding var text: String
    
    @FocusState private var isFocus: Bool
    
    var body: some View {
        VStack {
            TextField("", text: $text)
                .focused($isFocus)
                .focusablePadding()
                .autocapitalization(.none)
                .foregroundColor(Color("color-5"))
                .background(
                    ZStack(alignment: .leading) {
                        // Border
                        RoundedRectangle(cornerRadius: 12)
                            .strokeBorder(Color("color-\(isFocus ? 4 : 3)"))

                        // Label
                        Text(label)
                            .font(.system(size: 20, weight: .regular))
                            .padding(.horizontal, 8)
                            .foregroundColor(Color("color-5"))
                            .background(Color("color-1"))
                            .offset(x: 16, y: -28)

                        // Placeholder
                        if text == "" && !isFocus {
                            Text(verbatim: placeholder)
                                .font(.system(size: 16, weight: .light))
                                .foregroundColor(Color("color-3"))
                                .padding(16)
                        }
                    }
                )
                .padding(.bottom)
        }
    }
}
