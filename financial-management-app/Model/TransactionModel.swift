//
//  TransactionModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 26/6/2566 BE.
//

import Foundation

struct TxnModel: Hashable, Decodable {
    var TransactionId: String
    var Category: String
    var Wallet: String
    var Amount: Double
    var Note: String
    var Timestamp: Int64
}
