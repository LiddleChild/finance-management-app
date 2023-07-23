//
//  TransactionModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 26/6/2566 BE.
//

import Foundation

struct TxnModel: Hashable, Decodable, Encodable {
    var TransactionId: String?
    var Category: String
    var Wallet: String
    var Amount: Double
    var Note: String
    var Timestamp: Int64
}

extension TxnModel {
    static let DUMMY_LONG_NOTE = TxnModel(
        TransactionId: "1",
        Category: "hYlgrFddSlTsw2gY8uYk",
        Wallet: "nkoB55tzcxlbCrpwvwZl",
        Amount: 12345.67,
        Note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec bibendum, neque vulputate dignissim maximus, lectus eros rutrum nunc, quis dignissim erat velit in ante.",
        Timestamp: 1687737600
    )
    
    static let DUMMY_EMPTY_NOTE = TxnModel(
        TransactionId: "1",
        Category: "hYlgrFddSlTsw2gY8uYk",
        Wallet: "nkoB55tzcxlbCrpwvwZl",
        Amount: 12345.67,
        Note: "",
        Timestamp: 1687737600
    )
}
