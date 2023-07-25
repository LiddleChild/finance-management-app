//
//  CategoryViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 29/6/2566 BE.
//

import Foundation

class CategoryService {
    static let shared = CategoryService()
    private init() {}
    
    func fetch(completion: @escaping (Category) -> Void) {
        let url = URL(string: "http://localhost:3000/category")!
        
        HTTPService.shared.fetchData(for: url) { (result: Result<[String : CategoryModel], Error>) in
            switch result {
            case .success(let categories):
                completion(Category(categories: categories))
                break
                
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}
