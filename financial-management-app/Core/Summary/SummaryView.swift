//
//  SummaryView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 1/8/2566 BE.
//

import SwiftUI

struct SummaryView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            VStack {
                HeaderView(header: "Summary")
                
                Spacer()
            }
            .padding(.horizontal, 24)
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SettingView()
                .toolbar(.visible, for: .navigationBar)
        }
    }
}
