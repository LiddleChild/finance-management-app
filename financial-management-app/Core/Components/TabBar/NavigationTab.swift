//
//  TabItem.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 31/7/2566 BE.
//

import Foundation

enum NavigationTab: String, CaseIterable {
    case home
    case create
    case setting
    
    var image: String {
        switch self {
        case .home: return "house"
        case .create: return "plus"
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
