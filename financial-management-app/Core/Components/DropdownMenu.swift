//
//  DropdownMenu.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 21/7/2566 BE.
//

import SwiftUI

struct DropdownMenu: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DropdownMenu_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            DropdownMenu()
        }
    }
}
