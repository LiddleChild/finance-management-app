//
//  HomeViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 29/6/2566 BE.
//

import SwiftUI

@MainActor
class ContentViewModel: ObservableObject {
    private let walletService = WalletService.shared
    @Published var wallet = Wallet()
    
    private let categoryService = CategoryService.shared
    @Published var category = Category()
    
    init() {
        fetch()
    }
    
    func fetch() {
        categoryService.fetch { category in
            DispatchQueue.main.async {
                self.category = category
            }
        }
        
        walletService.fetch { wallet in
            DispatchQueue.main.async {
                self.wallet = wallet
            }
        }
    }
}
