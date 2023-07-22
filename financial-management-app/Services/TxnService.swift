//
//  TransactionViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 27/6/2566 BE.
//

import Foundation
import SwiftUI

class TxnService {
    func fetch(completion: @escaping ([TxnModel]?) -> Void) {
        guard let url = URL(string: "http://localhost:3000/transaction") else { return }
        
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
    
    func createTxn(txn: TxnModel) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(txn)
            
            guard let url = URL(string: "http://localhost:3000/transaction/create") else { return }
            var req = URLRequest(url: url)
            
            req.httpMethod = "POST"
            req.setValue("application/json", forHTTPHeaderField: "Content-Type")
            req.httpBody = data
            
            let task = URLSession.shared.dataTask(with: req) { data, res, error in
                guard let data = data, error == nil else { return }
                
                print(data)
                print(error)
            }
            
            task.resume()
        } catch {
            print("Error encoding json")
            return
        }
    }
}
