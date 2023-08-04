//
//  SettingTextField.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 3/8/2566 BE.
//

import SwiftUI

struct SettingTextField: View {
    @Binding var text: String
    var placeholder: String
    var body: some View {
        TextField("", text: $text)
            .focusablePadding(.vertical, 4)
            .background {
                if text == "" {
                    Text(verbatim: placeholder)
                        .font(.system(size: 16, weight: .light))
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
    }
}

private struct Preview: View {
    @State private var textField = ""
    var body: some View {
        ContentTemplate {
            SettingList {
                SettingTextField(text: $textField, placeholder: "PLACEHOLDER")
            }
        }
    }
}

struct SettingTextField_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
