//
//  CategoryViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 29/6/2566 BE.
//

import Foundation

class CategoryService {
    func fetch(completion: @escaping ([String : CategoryModel]?) -> Void) {
        guard let url = URL(string: "http://localhost:3000/category") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, res, error in
            guard let data = data, error == nil else { return }
            
            do {
                let categories = try JSONDecoder().decode([String : CategoryModel].self, from: data)
                
                DispatchQueue.main.async {
                    completion(categories)
                }
            } catch {
                print(error)
                completion(nil)
            }
        }
        
        task.resume()
    }
    
//    func getCategoryLabelById(id: String) -> String {
//        return categoryMap[id]?.Label ?? ""
//    }
//
//    func getCategoryColorById(id: String) -> Int {
//        return categoryMap[id]?.Color ?? 0xFFFFFF
//    }
//
//    func getColors() -> [(Double, Color)] {
//        var arrs: [(Double, Color)] = []
//        for (index, cat) in categoryMap.values.enumerated() {
//            arrs.append((Double(index), Color(hex: cat.Color)))
//        }
//
//        return arrs
//    }
}
