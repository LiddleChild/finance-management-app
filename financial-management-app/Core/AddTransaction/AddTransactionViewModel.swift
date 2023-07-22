//
//  AddTransactionViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 22/7/2566 BE.
//

import Foundation

class AddTransactionViewModel: ObservableObject {
    var amountField: NumbersOnly = NumbersOnly()
    var noteField: String = ""
    var walletField: DropdownOption?
    var categoryField: DropdownOption?
    
    func createTxn() {
        
    }
}
