//
//  TransactionViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 27/6/2566 BE.
//

import Foundation

class TxnViewModel: ObservableObject {
    @Published var txnLists: [TxnModel] = []
    @Published var dayTxnLists: [DayTxnModel] = []
    
    init() {
        fetchTransaction()
    }
    
    func fetchTransaction() {
        guard let url = URL(string: "http://localhost:3000/transaction") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, res, error in
            guard let data = data, error == nil else { return }
            
            do {
                let txns = try JSONDecoder().decode([TxnModel].self, from: data)
                
                DispatchQueue.main.async {
                    self?.txnLists = txns
                    self?.parseDayTransaction()
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
    
    func parseDayTransaction() {
        var dict: [Int64: [TxnModel]] = [:]
        var dayTxn: [DayTxnModel] = []
        
        for txn in txnLists {
            let key = txn.Timestamp - txn.Timestamp % (60 * 60 * 24)
            
            var tmp = dict[key] ?? []
            tmp.append(txn)

            dict[key] = tmp
        }
        
        for key in dict.keys.sorted(by: <) {
            dayTxn.append(.init(Timestamp: key, Transactions: dict[key] ?? []))
        }
        
        dayTxnLists = dayTxn
    }
}
