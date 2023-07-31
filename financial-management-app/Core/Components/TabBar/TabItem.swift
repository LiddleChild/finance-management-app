//
//  TabItem.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 31/7/2566 BE.
//

import Foundation

struct TabItem: Equatable {
    var Label: String
    var Icon: String
    var SelectedIcon: String
}

extension TabItem {
    static let DUMMY = [
        TabItem(Label: "House", Icon: "house", SelectedIcon: "house.fill"),
        TabItem(Label: "Person", Icon: "person", SelectedIcon: "person.fill"),
        TabItem(Label: "Setting", Icon: "gearshape", SelectedIcon: "gearshape.fill"),
    ]
}
