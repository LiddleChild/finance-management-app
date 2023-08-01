//
//  TabItem.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 31/7/2566 BE.
//

import Foundation

enum NavigationTab: String, CaseIterable {
    case home
    case history
    case create
    case summary
    case setting
    
    var image: String {
        switch self {
        case .home: return "house"
        case .history: return "clock"
        case .create: return "plus"
        case .summary: return "list.bullet.clipboard"
        case .setting: return "gearshape"
        }
    }
    
    var selectedImage: String {
        self.image + ".fill"
    }
    
    var enlarge: Bool {
        switch self {
        case .create: return true
        default: return false
        }
    }
}
