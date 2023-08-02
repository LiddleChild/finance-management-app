//
//  ContentTemplate.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 3/8/2566 BE.
//

import SwiftUI

struct ContentTemplate<Content: View>: View {
    @ViewBuilder var content: () -> Content
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.color1)
                .ignoresSafeArea()
            
            VStack {
                content()
            }
            .padding(.horizontal, 24)
        }
    }
}

struct ContentTemplate_Previews: PreviewProvider {
    static var previews: some View {
        ContentTemplate {
            Text("Hello, World")
                .foregroundColor(Color.color1)
        }
    }
}
