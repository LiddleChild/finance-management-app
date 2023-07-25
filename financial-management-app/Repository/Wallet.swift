//
//  Wallet.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 25/7/2566 BE.
//

import SwiftUI

struct Wallet {
    private var wallets: [String : WalletModel]
    
    init(wallets: [String : WalletModel] = [:]) {
        self.wallets = wallets
    }
    
    func getWalletLabelById(id: String) -> String {
        return wallets[id]?.Label ?? ""
    }

    func getWalletColorById(id: String) -> Int {
        return wallets[id]?.Color ?? 0xFFFFFF
    }
    
    func getWalletDropdownOptions() -> [DropdownOption] {
        return wallets.values.map { wallet in
            DropdownOption(
                OptionId: wallet.WalletId,
                Label: wallet.Label,
                Color: Color(hex: wallet.Color))
        }
    }
}
