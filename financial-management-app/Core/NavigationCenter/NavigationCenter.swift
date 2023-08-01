//
//  NavigationCenter.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 1/8/2566 BE.
//

import SwiftUI

@MainActor
class NavigationCenter: ObservableObject {
    static let shared = NavigationCenter()
    private init() { }
    
    @Published var selectedTab: NavigationTab = .home
    @Published var path: [ViewLists] = []
    
    func navigate(_ tab: NavigationTab) {
        self.selectedTab = tab
    }
    
    func goto(_ view: ViewLists) {
        self.path.append(view)
    }
    
    func back() {
        self.path.removeLast()
    }
    
    func backHome() {
        self.path = []
    }
}
