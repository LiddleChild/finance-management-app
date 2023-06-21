//
//  CustomNavigationSecondaryButton.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 21/6/2566 BE.
//

import Foundation
import SwiftUI

struct CustomNavigationSecondaryButton<Content: View>: View {
    let label: String
    @ViewBuilder var destination: Content
    
    var body: some View {
        NavigationLink {
            destination
        } label: {
            Text(label)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(Color("color-4"))
        }
    }
}

