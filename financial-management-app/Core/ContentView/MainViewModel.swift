//
//  MainViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 8/8/2566 BE.
//

import Foundation

@MainActor
class MainViewModel: ObservableObject {
    private let walletService = WalletService.shared
    @Published var wallet = Wallet()
    
    private let categoryService = CategoryService.shared
    @Published var category = Category()
    
    init() {
        fetch()
    }
    
    func fetch() {
        fetchCategory()
        fetchWallet()
    }
    
    func fetchCategory() {
        categoryService.fetch { category in
            DispatchQueue.main.async {
                self.category = category
            }
        }
    }
    
    func fetchWallet() {
        walletService.fetch { wallet in
            DispatchQueue.main.async {
                self.wallet = wallet
            }
        }
    }
}
