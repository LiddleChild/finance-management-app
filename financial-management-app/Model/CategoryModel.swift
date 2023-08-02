//
//  CategoryModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 29/6/2566 BE.
//

import Foundation

struct CategoryModel: Decodable {
    var CategoryId: String
    var Color: Int
    var Label: String
    var `Type`: String
}
