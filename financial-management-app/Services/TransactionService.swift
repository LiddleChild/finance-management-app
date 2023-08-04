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
    
    let httpService = HTTPService.shared
    
    func fetch(completion: @escaping (Transaction) -> Void) {
        let month = Calendar.current.component(.month, from: Date())
        let year = Calendar.current.component(.year, from: Date())
        
        fetchDate(month: month, year: year, completion: completion)
    }
    
    func fetchDate(month: Int, year: Int, completion: @escaping (Transaction) -> Void) {
        let url = URL(string: String(
            format: "http://\(httpService.BACKEND_ADDRESS)/transaction?month=%d&year=%d",
            month, year))!
        
        httpService.request(.GET, for: url) { (result: Result<[TransactionModel], Error>) in
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
        let url = URL(string: "http://\(httpService.BACKEND_ADDRESS)/transaction/today")!
        
        httpService.request(.GET, for: url) { (result: Result<[TransactionModel], Error>) in
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
            let url = URL(string: "http://\(httpService.BACKEND_ADDRESS)/transaction/")!
            var req = URLRequest(url: url)
            
            let encoder = JSONEncoder()
            req.httpBody = try encoder.encode(txn)
            
            httpService.request(.POST, for: req) { (result: Result<[String : String], Error>) in
                switch result {
                case .success(_):
                    completion(nil)
                    break
                    
                case .failure(let err):
                    completion(err)
                    break
                }
            }
        } catch (let err) {
            completion(err)
        }
    }
}
