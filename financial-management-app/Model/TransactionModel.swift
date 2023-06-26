//
//  TransactionModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 26/6/2566 BE.
//

import Foundation

struct TransactionModel: Hashable {
    var id: String
    var category: String
    var amount: Float
}
