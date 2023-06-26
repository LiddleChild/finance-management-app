//
//  NavigationDismissModifier.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 25/6/2566 BE.
//

import Foundation
import SwiftUI

struct NagivationDismissModier: ViewModifier {
    @Environment(\.dismiss) var dismiss
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .foregroundColor(Color("color-5"))
                        .padding()
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
    }
}
