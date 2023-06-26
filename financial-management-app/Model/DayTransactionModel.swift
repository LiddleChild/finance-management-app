//
//  DayTransactionModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 26/6/2566 BE.
//

import Foundation

struct DayTransactionModel {
    var id: String
    var timestamp: Int64
    var transactions: [TransactionModel]
}
