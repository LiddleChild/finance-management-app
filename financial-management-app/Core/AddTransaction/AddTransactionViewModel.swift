//
//  AddTransactionViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 22/7/2566 BE.
//

import Foundation

class AddTransactionViewModel: ObservableObject {
    var amountField: NumbersOnly = NumbersOnly()
    var walletField: DropdownOption?
    var categoryField: DropdownOption?
    var noteField: String = ""
    
    let txnService: TxnService = TxnService()
    
    func createTxn() {
        guard let category = categoryField else {
            print("Category is empty")
            return
        }
        
        guard let wallet = walletField else {
            print("Wallet is empty")
            return
        }
        
        guard amountField.getDouble() > 0 else {
            print("Amount must be greater than zero")
            return
        }
        
        let txn: TxnModel = TxnModel(
            Category: category.OptionId,
            Wallet: wallet.OptionId,
            Amount: amountField.getDouble(),
            Note: noteField,
            Timestamp: Int64(NSDate().timeIntervalSince1970)
        )
        
        txnService.createTxn(txn: txn)
    }
}
