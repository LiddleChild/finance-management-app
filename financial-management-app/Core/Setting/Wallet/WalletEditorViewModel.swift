//
//  WalletEditorViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 3/8/2566 BE.
//

import SwiftUI

@MainActor
class WalletEditorViewModel: ObservableObject {
    @Published var labelField: String = ""
    @Published var colorField: Color = .white
    
    let walletService = WalletService.shared
    
    func doesChange(_ wallet: WalletModel) -> Bool {
        return (labelField != "" && labelField != wallet.Label) || colorField != Color(hex: wallet.Color)
    }
    
    func patch(_ wallet: WalletModel, onSuccess: @escaping () -> Void, onFailure: @escaping (Error) -> Void) {
        let label = (labelField == "") ? wallet.Label : labelField
        let color = colorField.toHex()
        
        let patchedWallet = WalletModel(
            WalletId: wallet.WalletId,
            Color: color,
            Label: label)
        
        walletService.patch(wallet: patchedWallet) { err in
            if err != nil {
               onFailure(err!)
            } else {
                onSuccess()
            }
        }
    }
}
