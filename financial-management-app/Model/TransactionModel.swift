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
    var Amount: Float
    var Note: String
    var Timestamp: Int64
}

//struct TransactionModel: Hashable, Decodable {
//    var transactionId: String
//    var category: String
//    var wallet: String
//    var amount: Float
//    var note: String
//    var timestamp: Int64
//}
//
//extension TransactionModel {
//    static let dummy: [DayTransactionModel] = [
//        .init(id: "1", timestamp: 1687737600, transactions: [
//            .init(transactionId: "1", category: "Transfer",
//                  wallet: "kbank", amount: 12345.67, note: "A note", timestamp: 1687737600),
//            .init(transactionId: "2", category: "Transfer",
//                  wallet: "scb", amount: -12345.67, note: "", timestamp: 1687737600),
//        ]),
//        .init(id: "2", timestamp: 1687737600, transactions: [
//            .init(transactionId: "1", category: "Transfer",
//                  wallet: "kbank", amount: 12345.67, note: "", timestamp: 1687737600),
//            .init(transactionId: "2", category: "Transfer",
//                  wallet: "scb", amount: -12345.67, note: "", timestamp: 1687737600),
//        ]),
//        .init(id: "3", timestamp: 1687737600, transactions: [
//            .init(transactionId: "1", category: "Transfer",
//                  wallet: "kbank", amount: 12345.67, note: "", timestamp: 1687737600),
//            .init(transactionId: "2", category: "Transfer",
//                  wallet: "scb", amount: -12345.67, note: "", timestamp: 1687737600),
//        ]),
//        .init(id: "4", timestamp: 1687737600, transactions: [
//            .init(transactionId: "1", category: "Transfer",
//                  wallet: "kbank", amount: 12345.67, note: "", timestamp: 1687737600),
//            .init(transactionId: "2", category: "Transfer",
//                  wallet: "scb", amount: -12345.67, note: "", timestamp: 1687737600),
//        ]),
//        .init(id: "5", timestamp: 1687737600, transactions: [
//            .init(transactionId: "1", category: "Transfer",
//                  wallet: "kbank", amount: 12345.67, note: "", timestamp: 1687737600),
//            .init(transactionId: "2", category: "Transfer",
//                  wallet: "scb", amount: -12345.67, note: "", timestamp: 1687737600),
//        ]),
//        .init(id: "6", timestamp: 1687737600, transactions: [
//            .init(transactionId: "1", category: "Transfer",
//                  wallet: "kbank", amount: 12345.67, note: "", timestamp: 1687737600),
//            .init(transactionId: "2", category: "Transfer",
//                  wallet: "scb", amount: -12345.67, note: "", timestamp: 1687737600),
//        ]),
//    ]
//}
