//
//  SuccessModal.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 23/7/2566 BE.
//

import SwiftUI

struct Modal: View {
    @ObservedObject private var vm = ModalViewModel.shared
    
    private let width = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            ZStack(alignment: .bottom) {
                if vm.isShowing {
                    Rectangle()
                        .foregroundColor(.black.opacity(0.5))
                }
                
                if vm.isShowing {
                    VStack(spacing: 8) {
                        switch vm.modalType {
                        case .Alert:
                            ModalAlert(
                                title: vm.title,
                                message: vm.message,
                                symbol: vm.symbol,
                                symbolColor: vm.symbolColor)
                            
                        case .YesNoQuestion:
                            ModalYesNoQuestion(
                                title: vm.title,
                                message: vm.message,
                                symbol: vm.symbol,
                                symbolColor: vm.symbolColor) { value in
                                    vm.completion(ModalViewModel.Return(yesNoQuestion: value))
                                }
                        }
                    }
                    .transition(.move(edge: .bottom))
                    .padding(32)
                    .frame(width: width, height: width)
                    .foregroundColor(.black)
                    .background {
                        RoundedRectangle(cornerRadius: 36)
                            .foregroundColor(Color.color5)
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
//                ModalViewModel.shared.alertSuccess(
//                    duration: .infinity,
//                    title: "Success")
                
                ModalViewModel.shared.yesNoQuestion(
                    title: "Confirm?",
                    message: "You are about to delete") { value in
                        print(value)
                    }
                
//                ModalViewModel.shared.alertFailure(
//                    duration: .infinity,
//                    message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec molestie, arcu eu aliquet convallis, velit felis congue tortor, sit amet convallis nibh felis sed leo. Donec ultricies sodales neque, ut luctus justo interdum ac.")
            }
    }
}
