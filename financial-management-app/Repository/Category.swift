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
    
    func getCategoryDropdownOptions() -> [DropdownOption] {
        return categories.values.map { category in
            DropdownOption(
                OptionId: category.CategoryId,
                Label: category.Label,
                Color: Color(hex: category.Color))
        }
    }
}
