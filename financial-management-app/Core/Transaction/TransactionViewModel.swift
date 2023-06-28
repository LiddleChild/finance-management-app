//
//  TransactionViewModel.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 27/6/2566 BE.
//

import Foundation

class TxnViewModel: ObservableObject {
    @Published var txnLists: [TxnModel] = []

    func fetchTransaction() {
        guard let url = URL(string: "http://localhost:3000/transaction") else { return }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, res, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let txns = try JSONDecoder().decode([TxnModel].self, from: data)
                
                DispatchQueue.main.async {
                    self?.txnLists = txns
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
