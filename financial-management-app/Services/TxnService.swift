//
//  TransactionViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 27/6/2566 BE.
//

import SwiftUI

class TxnService {
    func fetch(completion: @escaping ([TxnModel]?) -> Void) {
        let month = Calendar.current.component(.month, from: Date())
        let year = Calendar.current.component(.year, from: Date())
        
        fetchDate(month: month, year: year, completion: completion)
    }
    
    func fetchDate(month: Int, year: Int, completion: @escaping ([TxnModel]?) -> Void) {
        let url = String(format: "http://localhost:3000/transaction?month=%d&year=%d", month, year)
        guard let url = URL(string: url) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, res, error in
            guard let data = data, error == nil else { return }
            
            do {
                let txns = try JSONDecoder().decode([TxnModel].self, from: data)
                
                DispatchQueue.main.async {
                    completion(txns)
                }
            } catch {
                print(error)
                completion(nil)
            }
        }
        
        task.resume()
    }
    
    func fetchToday(completion: @escaping ([TxnModel]?) -> Void) {
        let url = "http://localhost:3000/transaction/today"
        guard let url = URL(string: url) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, res, error in
            guard let data = data, error == nil else { return }
            
            do {
                let txns = try JSONDecoder().decode([TxnModel].self, from: data)
                
                DispatchQueue.main.async {
                    completion(txns)
                }
            } catch {
                print(error)
                completion(nil)
            }
        }
        
        task.resume()
    }
    
    func createTxn(txn: TxnModel, completion: @escaping (Error?) -> Void) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(txn)
            
            guard let url = URL(string: "http://localhost:3000/transaction/create") else { return }
            var req = URLRequest(url: url)
            
            req.httpMethod = "POST"
            req.setValue("application/json", forHTTPHeaderField: "Content-Type")
            req.httpBody = data
            
            let task = URLSession.shared.dataTask(with: req) { data, res, error in
                completion(error)
                return
            }
            
            task.resume()
        } catch {
            print("Error encoding json")
            return
        }
    }
}
