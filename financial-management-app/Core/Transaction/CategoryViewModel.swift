//
//  CategoryViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 29/6/2566 BE.
//

import Foundation

class CategoryViewModel: ObservableObject {
    @Published var categoryMap: [String: CategoryModel] = [:]
    
    init() {
        fetchCategory()
    }
    
    func fetchCategory() {
        guard let url = URL(string: "http://localhost:3000/category") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, res, error in
            guard let data = data, error == nil else { return }
            
            do {
                let cats = try JSONDecoder().decode([String: CategoryModel].self, from: data)
                
                DispatchQueue.main.async {
                    self?.categoryMap = cats
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
    
    func getCategoryLabelById(id: String) -> String {
        return categoryMap[id]?.Label ?? ""
    }
}
