//
//  TransactionViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 27/6/2566 BE.
//

import Foundation
import SwiftUI

class TxnService {
//    @Published var txnLists: [TxnModel] = []
//    @Published var dayTxnLists: [DayTxnModel] = []
//    @Published var quickSummaries: [(Double, Color)] = []
    
    func fetch(completion: @escaping ([TxnModel]?) -> Void)  {
        guard let url = URL(string: "http://localhost:3000/transaction") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, res, error in
            guard let data = data, error == nil else { return }
            
            do {
                let txns = try JSONDecoder().decode([TxnModel].self, from: data)
                
                DispatchQueue.main.async {
                    completion(txns)
//                    self?.txnLists = txns
//                    self?.parseDayTransaction()
//                    self?.getQuickSummary()
                }
            } catch {
                print(error)
                completion(nil)
            }
        }
        
        task.resume()
    }
}
