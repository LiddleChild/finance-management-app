//
//  TabBarView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 31/7/2566 BE.
//

import SwiftUI

struct TabBarMenu: View {
    @Binding var selection: TabItem
    var tabItems: [TabItem]
    
    var body: some View {
        HStack {
            ForEach(Array(tabItems.enumerated()), id: \.offset) { i, item in
                let isSelected = item == selection
                
                if i > 0 {
                    Spacer()
                }
                
                Image(systemName: isSelected ? item.SelectedIcon : item.Icon)
                    .padding()
                    .foregroundColor(isSelected ? Color("color-4") : .gray)
                    .scaleEffect(isSelected ? 1.25 : 1)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            selection = item
                        }
                    }
                
                if i < tabItems.count - 1 {
                    Spacer()
                }
            }
            .foregroundColor(Color("color-5"))
        }
        .background(Color("color-2"))
        .cornerRadius(32)
        .padding()
    }
}

private struct Preview: View {
    @State private var selection: TabItem = TabItem.DUMMY[0]
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            TabBarMenu(
                selection: $selection,
                tabItems: TabItem.DUMMY)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
