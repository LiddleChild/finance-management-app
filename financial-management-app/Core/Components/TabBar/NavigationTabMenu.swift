//
//  TabBarView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 31/7/2566 BE.
//

import SwiftUI

struct NavigationTabMenu: View {
    @EnvironmentObject private var navigationCenter: NavigationCenter
    
    @Binding var selectedTab: NavigationTab
    
    var body: some View {
        HStack {
            ForEach(NavigationTab.allCases, id: \.rawValue) { tab in
                let isSelected = tab == selectedTab
                
                if tab.enlarge {
                    Button {
                        navigationCenter.goto(ViewLists.ADD_TRANSACTION_VIEW)
                    } label: {
                        Image(systemName: tab.image)
                            .padding()
                            .foregroundColor(Color("color-5"))
                            .background(Circle().foregroundColor(Color("color-4")))
                            .scaleEffect(1.5)
                    }
                } else {
                    Image(systemName: isSelected ? tab.selectedImage : tab.image)
                        .padding()
                        .foregroundColor(isSelected ? Color("color-4") : .gray)
                        .scaleEffect(isSelected ? 1.25 : 1)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                selectedTab = tab
                            }
                        }
                }
                
                if tab != NavigationTab.allCases.last {
                    Spacer()
                }
            }
            .foregroundColor(Color("color-5"))
        }
        .background {
            Color.color2
                .opacity(0.9)
                .clipShape(RoundedRectangle(cornerRadius: 32))
        }
    }
}

private struct Preview: View {
    @State private var selectedTab: NavigationTab = .home
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            NavigationTabMenu(selectedTab: $selectedTab)
            .padding(36)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
