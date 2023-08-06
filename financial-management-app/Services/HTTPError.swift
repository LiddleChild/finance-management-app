//
//  HTTPError.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 6/8/2566 BE.
//

import Foundation

enum HTTPError: LocalizedError {
    case clientError(String)
    case serverError(String)
}
