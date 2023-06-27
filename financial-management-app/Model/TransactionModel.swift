//
//  TransactionModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 26/6/2566 BE.
//

import Foundation

struct TransactionModel: Hashable {
    var transactionId: String
    var category: String
    var wallet: String
    var amount: Float
    var note: String
    var timestamp: Int64
}
