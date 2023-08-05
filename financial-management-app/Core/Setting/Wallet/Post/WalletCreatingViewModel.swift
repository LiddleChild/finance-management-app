//
//  WalletCreatingViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 4/8/2566 BE.
//

import SwiftUI

@MainActor
class WalletCreatingViewModel: ObservableObject {
    @Published var labelField: String = ""
    @Published var colorField: Color = .white
    
    let walletService = WalletService.shared
    
    func isFormFilled() -> Bool {
        return labelField != ""
    }
    
    func post(onSuccess: @escaping () -> Void, onFailure: @escaping (Error) -> Void) {
        let label = labelField
        let color = colorField.toHex()
        
        let wallet = WalletModel(Color: color, Label: label)
        
        walletService.post(wallet: wallet) { err in
            if err != nil {
                print(err!)
                onFailure(err!)
            } else {
                onSuccess()
            }
        }
    }
}
