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
    var Transactions: [TransactionModel]
}

extension DayTxnModel {
    static let DUMMY = DayTxnModel(Timestamp: 1687737600, Transactions: [
        TransactionModel.DUMMY_EMPTY_NOTE,
        TransactionModel.DUMMY_LONG_NOTE
    ])
}
