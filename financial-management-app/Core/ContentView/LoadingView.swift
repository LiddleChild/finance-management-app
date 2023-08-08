//
//  LoadingView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 7/8/2566 BE.
//

import SwiftUI

struct LoadingView: View {
    @State private var rotation = 0.0
    var body: some View {
        ContentTemplate {
            Image(systemName: "gear")
                .font(.system(size: 64))
                .foregroundColor(.color4)
                .rotationEffect(.degrees(rotation))
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                            rotation = 360.0
                        }
                }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
