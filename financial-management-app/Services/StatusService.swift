//
//  StatusService.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 8/8/2566 BE.
//

import Foundation

class StatusService {
    static let shared = StatusService()
    private init() {}
    
    private let httpService = HTTPService.shared
    
    func ping(completion: @escaping (Error?) -> Void) {
        let url = URL(string: "http://\(httpService.BACKEND_ADDRESS)/")!
        httpService.request(.GET, for: url) { (result: Result<[String : String], Error>) in
            switch result {
            case .success(_):
                completion(nil)
                break
                
            case .failure(let error):
                completion(error)
                break
            }
        }
    }
}
