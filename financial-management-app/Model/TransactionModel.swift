//
//  TransactionModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 26/6/2566 BE.
//

import Foundation

struct TransactionModel: Hashable, Decodable, Encodable {
    var TransactionId: String?
    var Category: String
    var Wallet: String
    var Amount: Double
    var Note: String
    var Timestamp: Int64
}

extension TransactionModel {
    static let DUMMY_LONG_NOTE = TransactionModel(
        TransactionId: "1",
        Category: "61f3e9cf-f0ca-4751-89d0-b2445e8aa5ed",
        Wallet: "1b53e7df-c339-4291-8e64-0c4203b76a74",
        Amount: 12345.67,
        Note: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec bibendum, neque vulputate dignissim maximus, lectus eros rutrum nunc, quis dignissim erat velit in ante.",
        Timestamp: 1687737600
    )
    
    static let DUMMY_EMPTY_NOTE = TransactionModel(
        TransactionId: "2",
        Category: "2629338b-ad89-4043-90cf-f99f967930cb",
        Wallet: "1b53e7df-c339-4291-8e64-0c4203b76a74",
        Amount: -12345.67,
        Note: "",
        Timestamp: 1687737700
    )
    
    static let DUMMYS = [DUMMY_LONG_NOTE, DUMMY_EMPTY_NOTE]
}
