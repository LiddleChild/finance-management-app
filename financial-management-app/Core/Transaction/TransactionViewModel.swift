//
//  TransactionViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 27/6/2566 BE.
//

import Foundation

final class TransactionViewModel: ObservableObject {
    @Published var transactionLists: [TransactionModel] = []
    
    func getTransaction() {
        
    }
}
