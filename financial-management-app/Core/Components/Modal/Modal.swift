//
//  SuccessModal.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 23/7/2566 BE.
//

import SwiftUI

struct Modal: View {
    @ObservedObject private var modalViewModel: ModalViewModel = ModalViewModel.shared
    
    var body: some View {
        ZStack {
            if modalViewModel.isShowing {
                Group {
                    Rectangle()
                        .foregroundColor(.black.opacity(0.5))
                    
                    VStack(spacing: 8) {
                        Image(systemName: modalViewModel.symbol)
                            .resizable()
                            .frame(width: 64, height: 64)
                            .foregroundColor(modalViewModel.symbolColor)
                            .scaledToFill()
                        
                        Text(verbatim: ModalViewModel.shared.message)
                            .foregroundColor(.black)
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
        .ignoresSafeArea()
    }
}

struct Modal_Previews: PreviewProvider {
    static var previews: some View {
        Modal()
            .onAppear {
                ModalViewModel.shared.alertSuccess(
                    duration: .infinity,
                    message: "Success!")
            }
    }
}
