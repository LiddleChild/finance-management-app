//
//  TransactionViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 27/6/2566 BE.
//

import SwiftUI

class TransactionService {
    static let shared = TransactionService()
    private init() {}
    
    func fetch(completion: @escaping (Transaction) -> Void) {
        let month = Calendar.current.component(.month, from: Date())
        let year = Calendar.current.component(.year, from: Date())
        
        fetchDate(month: month, year: year, completion: completion)
    }
    
    func fetchDate(month: Int, year: Int, completion: @escaping (Transaction) -> Void) {
        let url = URL(string: String(
            format: "http://localhost:3000/transaction?month=%d&year=%d",
            month, year))!
        
        HTTPService.shared.request(.GET, for: url) { (result: Result<[TransactionModel], Error>) in
            switch result {
            case .success(let txns):
                completion(Transaction(txns: txns))
                break
                
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    func fetchToday(completion: @escaping ([TransactionModel]) -> Void) {
        let url = URL(string: "http://localhost:3000/transaction/today")!
        
        HTTPService.shared.request(.GET, for: url) { (result: Result<[TransactionModel], Error>) in
            switch result {
            case .success(let txns):
                completion(txns)
                break
                
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    func createTxn(txn: TransactionModel, completion: @escaping (Error?) -> Void) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(txn)
            
            guard let url = URL(string: "http://localhost:3000/transaction/") else { return }
            var req = URLRequest(url: url)
            
            req.httpMethod = "POST"
            req.setValue("application/json", forHTTPHeaderField: "Content-Type")
            req.httpBody = data
            
            HTTPService.shared.request(.POST, for: req) { (result: Result<[String : String], Error>) in
                switch result {
                case .success(_):
                    completion(nil)
                    break
                    
                case .failure(let error):
                    print(error)
                    break
                }
            }
        } catch (let error) {
            print(error)
        }
    }
}
