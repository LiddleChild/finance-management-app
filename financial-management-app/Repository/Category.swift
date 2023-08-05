//
//  Category.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 25/7/2566 BE.
//

import SwiftUI

struct Category {
    private var categories: [String : CategoryModel]
    
    init(categories: [String : CategoryModel] = [:]) {
        self.categories = categories
    }
    
    func getCategoryLabelById(id: String) -> String {
        return categories[id]?.Label ?? ""
    }
    
    func getCategoryColorById(id: String) -> Int {
        return categories[id]?.Color ?? 0xFFFFFF
    }
    
    func getIncomeCategoryDropdownOptions() -> [DropdownOption] {
        return categories.values
            .filter { $0.Type == "INCOME" || $0.Type == "BOTH" }
            .map { category in
            DropdownOption(
                OptionId: category.CategoryId!,
                Label: category.Label,
                Color: Color(hex: category.Color))
        }
    }
    
    func getExpenseCategoryDropdownOptions() -> [DropdownOption] {
        return categories.values
            .filter { $0.Type == "EXPENSE" || $0.Type == "BOTH" }
            .map { category in
            DropdownOption(
                OptionId: category.CategoryId!,
                Label: category.Label,
                Color: Color(hex: category.Color))
        }
    }
    
    func getCategory() -> [CategoryModel] {
        return self.categories.map { $1 }
    }
}

extension Category {
    static let DUMMY = Category(categories: [
        "hYlgrFddSlTsw2gY8uYk": CategoryModel(CategoryId: "hYlgrFddSlTsw2gY8uYk", Color: 0xFF0000, Label: "RED", Type: "EXPENSE"),
        "3YlgrFddSlTsw3gY8uYk": CategoryModel(CategoryId: "3YlgrFddSlTsw3gY8uYk", Color: 0x0000FF, Label: "BLUE", Type: "INCOME"),
    ])
}
