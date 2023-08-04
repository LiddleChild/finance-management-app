//
//  HTTPService.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 25/7/2566 BE.
//

import Foundation

class HTTPService {
    static let shared = HTTPService()
    private init() {}
    
    let BACKEND_ADDRESS = "192.168.1.40:3000"
    
    enum Method: String {
        case GET, POST, PATCH, DELETE
    }
    
    func request<T: Decodable>(_ method: Method, for url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        request(method, for: URLRequest(url: url), completion: completion)
    }
    
    func request<T: Decodable>(_ method: Method, for url: URLRequest, completion: @escaping (Result<T, Error>) -> Void) {
        var req = url
        req.httpMethod = method.rawValue
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: req) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                do {
                    let object = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(object))
                } catch let decoderError {
                    completion(.failure(decoderError))
                }
            }
        }
        .resume()
    }
}
