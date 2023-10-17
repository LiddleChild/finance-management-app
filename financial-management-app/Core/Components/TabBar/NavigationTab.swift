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
    case setting
    
    var image: String {
        switch self {
        case .home: return "house"
        case .history: return "clock"
        case .create: return "plus.circle"
        case .setting: return "gearshape"
        }
    }
    
    var selectedImage: String {
        self.image + ".fill"
    }
}
