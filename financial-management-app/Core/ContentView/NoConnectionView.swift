//
//  NoConnectionView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 8/8/2566 BE.
//

import SwiftUI

struct NoConnectionView: View {
    @State private var offset = 0.0
    var body: some View {
        ContentTemplate {
            VStack(spacing: 16) {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 64))
                    .foregroundColor(.red)
                    .offset(y: offset)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                            offset = -8.0
                        }
                    }
                
                Text("Could not connect to server.\nRetrying...")
                    .font(.system(size: 16))
                    .foregroundColor(.color5)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct NoConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        NoConnectionView()
    }
}
