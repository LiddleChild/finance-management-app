//
//  HomeViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 29/6/2566 BE.
//

import SwiftUI

@MainActor
class ViewModel: ObservableObject {
    @Published var wallet = Wallet()
    @Published var category = Category()
    
    private let categoryService = CategoryService.shared
    private let walletService = WalletService.shared
    
    
    func fetch() {
        categoryService.fetch { category in
            self.category = category
        }
        
        walletService.fetch { wallet in
            self.wallet = wallet
        }
    }
}
