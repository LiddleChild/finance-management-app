//
//  WalletService.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 19/7/2566 BE.
//

import Foundation

class WalletService {
    
    func fetch(completion: @escaping ([String : WalletModel]?) -> Void) {
        guard let url = URL(string: "http://localhost:3000/wallet") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, res, error in
            guard let data = data, error == nil else { return }
            
            do {
                let categories = try JSONDecoder().decode([String : WalletModel].self, from: data)
                
                DispatchQueue.main.async {
                    completion(categories)
                }
            } catch {
                print(error)
                completion(nil)
            }
        }
        
        task.resume()
    }
    
}
