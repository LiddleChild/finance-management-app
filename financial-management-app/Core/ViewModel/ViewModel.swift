//
//  HomeViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 29/6/2566 BE.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var categories: [String : CategoryModel] = [:]
    @Published var wallets: [String : WalletModel] = [:]
    @Published var txns: [TxnModel] = []
    
    private let categoryService: CategoryService = CategoryService()
    private let txnService: TxnService = TxnService()
    private let walletService: WalletService = WalletService()
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        let group = DispatchGroup()
        
        // Fetch category
        group.enter()
        categoryService.fetch { categories in
            DispatchQueue.main.async {
                self.categories = categories ?? [:]
                print("Category fetched!")
                group.leave()
            }
        }
        
        // Fetch transaction
        group.enter()
        txnService.fetch { txns in
            DispatchQueue.main.async {
                self.txns = txns ?? []
                print("Transaction fetched!")
                group.leave()
            }
        }
        
        // Fetch wallet
        group.enter()
        walletService.fetch { wallets in
            DispatchQueue.main.async {
                self.wallets = wallets ?? [:]
                print("Wallet fetched!")
                print(self.wallets.values)
                group.leave()
            }
        }
        
        // Call when fetching complete
        group.notify(queue: .main) {
//            print(self.categories)
//            print(self.txns)
        }
    }
    
    func getQuickSummary() -> [(Double, Color)] {
        var dict: [Bool : Double] = [:]
        var summary: [(Double, Color)] = []

        for txn in txns {
            let key = txn.Amount >= 0

            var tmp = dict[key] ?? 0
            tmp += txn.Amount * (key ? 1 : -1)
            dict[key] = tmp
        }

        for key in dict.keys {
            summary.append(
                (dict[key]!, key ? Color("color-green") : Color("color-red"))
            )
        }
        
        return summary
    }
    
    func getQuickSummaryAmount() -> Double {
        var amount: Double = 0
        
        for txn in txns {
            if txn.Amount >= 0 { continue }
            
            amount -= txn.Amount
        }
        
        return amount
    }
    
    func getDayTransaction() -> [DayTxnModel] {
        var dict: [Int64: [TxnModel]] = [:]
        var dayTxn: [DayTxnModel] = []

        for txn in txns {
            let key = txn.Timestamp - txn.Timestamp % (60 * 60 * 24)

            var tmp = dict[key] ?? []
            tmp.append(txn)
            dict[key] = tmp
        }

        for key in dict.keys.sorted(by: <) {
            dayTxn.append(.init(Timestamp: key, Transactions: dict[key]!))
        }
        
        return dayTxn
    }
    
    func getCategoryLabelById(id: String) -> String {
        return categories[id]?.Label ?? ""
    }

    func getCategoryColorById(id: String) -> Int {
        return categories[id]?.Color ?? 0xFFFFFF
    }
    
    func getWalletLabelById(id: String) -> String {
        return wallets[id]?.Label ?? ""
    }

    func getWalletColorById(id: String) -> Int {
        return wallets[id]?.Color ?? 0xFFFFFF
    }
    
    func getWalletDropdownOptions() -> [DropdownOption] {
        return wallets.values.map { wallet in
            DropdownOption(OptionId: wallet.WalletId,
                           Label: wallet.Label,
                           Color: Color(hex: wallet.Color))
        }
    }
    
    func getCategoryDropdownOptions() -> [DropdownOption] {
        return categories.values.map { category in
            DropdownOption(OptionId: category.CategoryId,
                           Label: category.Label,
                           Color: Color(hex: category.Color))
        }
    }
}
