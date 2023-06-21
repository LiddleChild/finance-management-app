//
//  CustomSecondaryButton.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 21/6/2566 BE.
//

import Foundation
import SwiftUI

struct CustomSecondaryButton: View {
    let label: String
    let callback: () -> ()
    
    var body: some View {
        Button(label) {
            callback()
        }
        .font(.system(size: 16, weight: .regular))
        .foregroundColor(Color("color-4"))
    }
}
