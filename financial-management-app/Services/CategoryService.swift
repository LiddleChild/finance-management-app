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
    
    func patch(category: CategoryModel, completion: @escaping (Error?) -> Void) {
        do {
            let url = URL(string: "http://\(httpService.BACKEND_ADDRESS)/category")!
            var req = URLRequest(url: url)
            
            let encoder = JSONEncoder()
            req.httpBody = try encoder.encode(category)
            
            httpService.request(.PATCH, for: req) { (result: Result<[String : String], Error>) in
                switch result {
                case .success(_):
                    completion(nil)
                    break
                    
                case .failure(let error):
                    completion(error)
                    break
                }
            }
        } catch (let error) {
            completion(error)
        }
    }
    
    func post(category: CategoryModel, completion: @escaping (Error?) -> Void) {
        do {
            let url = URL(string: "http://\(httpService.BACKEND_ADDRESS)/category")!
            var req = URLRequest(url: url)
            
            let encoder = JSONEncoder()
            req.httpBody = try encoder.encode(category)
            
            httpService.request(.POST, for: req) { (result: Result<[String : String], Error>) in
                switch result {
                case .success(_):
                    completion(nil)
                    break
                    
                case .failure(let error):
                    completion(error)
                    break
                }
            }
        } catch (let error) {
            completion(error)
        }
    }
    
    func delete(category: CategoryModel, completion: @escaping (Error?) -> Void) {
        do {
            let url = URL(string: "http://\(httpService.BACKEND_ADDRESS)/category")!
            var req = URLRequest(url: url)
            
            let encoder = JSONEncoder()
            req.httpBody = try encoder.encode(category)
            
            httpService.request(.DELETE, for: req) { (result: Result<[String : String], Error>) in
                switch result {
                case .success(_):
                    completion(nil)
                    break
                    
                case .failure(let error):
                    completion(error)
                    break
                }
            }
        } catch (let error) {
            completion(error)
        }
    }
}
