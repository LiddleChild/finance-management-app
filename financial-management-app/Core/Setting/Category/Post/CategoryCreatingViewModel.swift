//
//  CategoryCreatingViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 5/8/2566 BE.
//

import SwiftUI

@MainActor
class CategoryCreatingViewModel: ObservableObject {
    @Published var labelField: String = ""
    @Published var colorField: Color = .white
    
    let categoryService = CategoryService.shared
    
    func isFormFilled() -> Bool {
        return labelField != ""
    }
    
    func post(_ categoryType: String, onSuccess: @escaping () -> Void, onFailure: @escaping (Error) -> Void) {
        let label = labelField
        let color = colorField.toHex()
        
        let category = CategoryModel(Color: color, Label: label, Type: categoryType)
        
        categoryService.post(category: category) { err in
            if err != nil {
                print(err!)
                onFailure(err!)
            } else {
                onSuccess()
            }
        }
    }
}
