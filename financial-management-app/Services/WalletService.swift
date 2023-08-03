//
//  WalletService.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 19/7/2566 BE.
//

import Foundation

class WalletService {
    static let shared = WalletService()
    private init() {}
    
    func fetch(completion: @escaping (Wallet) -> Void) {
        let url = URL(string: "http://localhost:3000/wallet")!
        
        HTTPService.shared.request(.GET, for: url) { (result: Result<[String : WalletModel], Error>) in
            switch result {
            case .success(let wallets):
                completion(Wallet(wallets: wallets))
                break
                
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}
