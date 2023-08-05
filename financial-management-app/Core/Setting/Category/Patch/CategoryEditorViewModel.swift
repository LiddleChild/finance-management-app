//
//  CategoryEditorViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 5/8/2566 BE.
//

import SwiftUI

@MainActor
class CategoryEditorViewModel: ObservableObject {
    @Published var labelField: String = ""
    @Published var colorField: Color = .white
    
    let categoryService = CategoryService.shared
    
    func doesChange(_ category: CategoryModel) -> Bool {
        return (labelField != "" && labelField != category.Label) || colorField != Color(hex: category.Color)
    }
    
    func patch(_ category: CategoryModel, onSuccess: @escaping () -> Void, onFailure: @escaping (Error) -> Void) {
        let label = (labelField == "") ? category.Label : labelField
        let color = colorField.toHex()
        
        let patchedCategory = CategoryModel(
            CategoryId: category.CategoryId,
            Color: color,
            Label: label,
            Type: category.Type)
        
        categoryService.patch(category: patchedCategory) { err in
            if err != nil {
                print(err!)
                onFailure(err!)
            } else {
                onSuccess()
            }
        }
    }
    
    func delete(_ category: CategoryModel, onSuccess: @escaping () -> Void, onFailure: @escaping (Error) -> Void) {
        categoryService.delete(category: category) { err in
            if err != nil {
                print(err!)
                onFailure(err!)
            } else {
                onSuccess()
            }
        }
    }
}
