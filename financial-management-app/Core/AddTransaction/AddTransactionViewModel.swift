//
//  AddTransactionViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 22/7/2566 BE.
//

import SwiftUI

class AddTransactionViewModel: ObservableObject {
    var walletField: DropdownOption?
    var categoryField: DropdownOption?
    
    @Published var noteField: String = ""
    @Published var amountField: NumbersOnly = NumbersOnly()
    @Published var expenseField: Bool = true {
        didSet {
            categoryField = nil
        }
    }
    
    let expenseState: [ToggleButtonState] = [
        ToggleButtonState(Label: "Income", ActiveColor: Color("color-green")),
        ToggleButtonState(Label: "Expense", ActiveColor: Color("color-red")),
    ]
    
    let txnService: TransactionService = TransactionService.shared
    
    func createTxn(onSuccess: @escaping () -> Void, onFailure: @escaping (Error) -> Void) {
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
        
        let txn: TransactionModel = TransactionModel(
            Category: category.OptionId,
            Wallet: wallet.OptionId,
            Amount: amountField.getDouble() * (expenseField ? -1 : 1),
            Note: noteField,
            Timestamp: Int64(NSDate().timeIntervalSince1970)
        )
        
        txnService.createTxn(txn: txn) { error in
            if error != nil {
                print(error!)
                onFailure(error!)
            } else {
                onSuccess()
            }
        }
    }
}
