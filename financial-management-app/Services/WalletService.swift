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
    
    let httpService = HTTPService.shared
    
    func fetch(completion: @escaping (Wallet) -> Void) {
        let url = URL(string: "http://\(httpService.BACKEND_ADDRESS)/wallet")!
        
        httpService.request(.GET, for: url) { (result: Result<[String : WalletModel], Error>) in
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
    
    func patch(wallet: WalletModel, completion: @escaping (Error?) -> Void) {
        do {
            let url = URL(string: "http://\(httpService.BACKEND_ADDRESS)/wallet")!
            var req = URLRequest(url: url)
            
            let encoder = JSONEncoder()
            req.httpBody = try encoder.encode(wallet)
            
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
    
    func post(wallet: WalletModel, completion: @escaping (Error?) -> Void) {
        do {
            let url = URL(string: "http://\(httpService.BACKEND_ADDRESS)/wallet")!
            var req = URLRequest(url: url)
            
            let encoder = JSONEncoder()
            req.httpBody = try encoder.encode(wallet)
            
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
    
    func delete(wallet: WalletModel, completion: @escaping (Error?) -> Void) {
        do {
            let url = URL(string: "http://\(httpService.BACKEND_ADDRESS)/wallet")!
            var req = URLRequest(url: url)
            
            let encoder = JSONEncoder()
            req.httpBody = try encoder.encode(wallet)
            
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
