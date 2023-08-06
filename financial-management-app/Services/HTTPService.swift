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
        
        print("\(method.rawValue) \(url.url!)")
        
        URLSession.shared.dataTask(with: req) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            if let data = data {
                do {
                    if let response = response as? HTTPURLResponse {
                        let responseType = response.statusCode / 100
                        if responseType == 4 {
                            let object = try JSONDecoder().decode([String : String].self, from: data)
                            completion(.failure(HTTPError.clientError(object["Message"]!)))
                        } else if responseType == 5 {
                            let object = try JSONDecoder().decode([String : String].self, from: data)
                            completion(.failure(HTTPError.serverError(object["Message"]!)))
                        } else {
                            let object = try JSONDecoder().decode(T.self, from: data)
                            completion(.success(object))
                        }
                    }
                } catch let decoderError {
                    completion(.failure(decoderError))
                }
            }
        }
        .resume()
    }
}
