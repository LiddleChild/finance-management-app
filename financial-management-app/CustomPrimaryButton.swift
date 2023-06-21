//
//  CustomButton.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 21/6/2566 BE.
//

import Foundation
import SwiftUI

struct CustomPrimaryButton: View {
    let label: String
    let callback: () -> ()
    
    var body: some View {
        Button() {
            callback()
        } label: {
            Text(label)
                .font(.system(size: 20, weight: .regular))
                .foregroundColor(Color("color-5"))
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
        }
        .background(
            RoundedRectangle(cornerRadius: 12).foregroundColor(Color("color-4"))
        )
        .padding(.bottom)
    }
}
