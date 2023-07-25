//
//  HomeViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 25/7/2566 BE.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    @Published var transaction = Transaction()
    @Published var todayTransactions: [TransactionModel] = []
    
    let txnService = TransactionService.shared
    
    func fetch() {
        txnService.fetch { txn in
            self.transaction = txn
        }
        
        txnService.fetchToday { txns in
            self.todayTransactions = txns
        }
    }
}
