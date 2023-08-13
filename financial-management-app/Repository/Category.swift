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
        return self.categories[id]?.Label ?? ""
    }
    
    func getCategoryColorById(id: String) -> Int {
        return self.categories[id]?.Color ?? 0xFFFFFF
    }
    
    func getDropdownOption(id: String) -> DropdownOption {
        print(categories)
        return DropdownOption(
            OptionId: id,
            Label: getCategoryLabelById(id: id),
            Color: Color(hex: getCategoryColorById(id: id)))
    }
    
    func getIncomeCategoryDropdownOptions() -> [DropdownOption] {
        return self.categories.values
            .filter { $0.Type == "INCOME" || $0.Type == "BOTH" }
            .map { category in
            DropdownOption(
                OptionId: category.CategoryId!,
                Label: category.Label,
                Color: Color(hex: category.Color))
        }
    }
    
    func getExpenseCategoryDropdownOptions() -> [DropdownOption] {
        return self.categories.values
            .filter { $0.Type == "EXPENSE" || $0.Type == "BOTH" }
            .map { category in
            DropdownOption(
                OptionId: category.CategoryId!,
                Label: category.Label,
                Color: Color(hex: category.Color))
        }
    }
    
    func getIncomeCategory() -> [CategoryModel] {
        return self.categories.values
            .filter { $0.Type == "INCOME" || $0.Type == "BOTH" }
            .map { $0 }
    }
    
    func getExpenseCategory() -> [CategoryModel] {
        return self.categories.values
            .filter { $0.Type == "EXPENSE" || $0.Type == "BOTH" }
            .map { $0 }
    }
}

extension Category {
    static let DUMMY = Category(categories: [
        "hYlgrFddSlTsw2gY8uYk": CategoryModel(CategoryId: "hYlgrFddSlTsw2gY8uYk", Color: 0xFF0000, Label: "RED", Type: "EXPENSE"),
        "3YlgrFddSlTsw3gY8uYk": CategoryModel(CategoryId: "3YlgrFddSlTsw3gY8uYk", Color: 0x0000FF, Label: "BLUE", Type: "INCOME"),
    ])
}
