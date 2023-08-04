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
    
    let httpService = HTTPService.shared
    
    func fetch(completion: @escaping (Category) -> Void) {
        let url = URL(string: "http://\(httpService.BACKEND_ADDRESS)/category")!
        
        httpService.request(.GET, for: url) { (result: Result<[String : CategoryModel], Error>) in
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
