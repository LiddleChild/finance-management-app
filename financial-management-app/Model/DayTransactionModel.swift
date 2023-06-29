//
//  DayTransactionModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 26/6/2566 BE.
//

import Foundation

struct DayTxnModel: Hashable {
    var DayTransactionId: String = UUID().uuidString
    var Timestamp: Int64
    var Transactions: [TxnModel]
}
