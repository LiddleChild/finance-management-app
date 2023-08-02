//
//  SettingList.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 2/8/2566 BE.
//

import SwiftUI

struct SettingList<Content: View>: View {
    var title: String?
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if title != nil {
                Text(verbatim: title!)
                    .font(.system(size: 24, weight: .regular))
            }
            
            VStack(spacing: 8, content: content)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(8)
                .background(RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(Color.color2))
        }
        .foregroundColor(Color.color5)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 24)
    }
}

struct SettingList_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            VStack {
                SettingList(title: "Group") {
                    Text("A")
                    Text("B")
                    Text("C")
                    Text("D")
                }
                
                SettingList() {
                    Text("A")
                    Text("B")
                    Text("C")
                    Text("D")
                }
            }
            .padding(.horizontal, 24)
        }
    }
}
