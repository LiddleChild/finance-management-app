//
//  FailureModal.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 23/7/2566 BE.
//

import SwiftUI

struct FailureModal: View {
    var text: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.black.opacity(0.5))
            
            VStack(spacing: 8) {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 64, height: 64)
                    .foregroundColor(.red)
                    .scaledToFill()
                
                Text(verbatim: text)
                    .font(.system(size: 24, weight: .regular))
            }
            .frame(width: 216, height: 216)
            .background {
                RoundedRectangle(cornerRadius: 24)
                    .foregroundColor(Color("color-5"))
            }
        }
    }
}

struct FailureModal_Previews: PreviewProvider {
    static var previews: some View {
        FailureModal(text: "Error!")
    }
}
