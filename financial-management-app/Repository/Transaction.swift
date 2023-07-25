//
//  FetchedTransactionModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 25/7/2566 BE.
//

import SwiftUI

struct Transaction {
    private var txns: [TransactionModel]
    
    init(txns: [TransactionModel] = []) {
        self.txns = txns
    }
    
    func getTransactions() -> [TransactionModel] {
        return self.txns
    }
    
    func getExpenseAmount() -> Double {
        return txns.reduce(0.0) { $1.Amount < 0 ? $0 + -$1.Amount : $0 }
    }
    
    func getExpenseSummary() -> [(Double, Color)] {
        var dict: [Bool : Double] = [:]
        var summary: [(Double, Color)] = []
        
        for txn in txns {
            let key = txn.Amount >= 0
            var tmp = dict[key] ?? 0
            tmp += txn.Amount * (key ? 1 : -1)
            dict[key] = tmp
        }
        
        for key in dict.keys {
            summary.append((
                dict[key]!,
                key ? Color("color-green") : Color("color-red")
            ))
        }
        
        return summary
    }
    
    func getDayTransaction() -> [DayTxnModel] {
        var dict: [Int64: [TransactionModel]] = [:]
        var dayTxn: [DayTxnModel] = []
        
        for txn in txns {
            let key = txn.Timestamp - txn.Timestamp % (60 * 60 * 24)
            var tmp = dict[key] ?? []
            tmp.append(txn)
            dict[key] = tmp
        }
        
        for key in dict.keys.sorted(by: >) {
            dayTxn.append(.init(Timestamp: key, Transactions: dict[key]!))
        }
        
        return dayTxn
    }
}
