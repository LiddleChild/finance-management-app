//
//  SettingNavigationLink.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 2/8/2566 BE.
//

import SwiftUI

struct SettingNavigationLink<Content: View>: View {
    var label: String
    @ViewBuilder var destination: () -> Content
    
    var body: some View {
        NavigationLink {
            ContentTemplate {
                HeaderView(header: label)
                
                destination()
                
                Spacer()
            }
            .modifier(NagivationDismissModier())
        } label: {
            HStack {
                Text(verbatim: label)
                    .font(.system(size: 20))
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            .foregroundColor(Color.color5)
            .padding(.vertical, 4)
        }
    }
}

struct SettingNavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentTemplate {
                SettingNavigationLink(label: "Navigate 1") {
                    SettingNavigationLink(label: "Navigate 2") {
                        Text("jaskldf")
                    }
                }
            }
        }
    }
}
