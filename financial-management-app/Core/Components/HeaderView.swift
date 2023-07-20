//
//  HeadingView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 27/6/2566 BE.
//

import SwiftUI

struct HeaderView: View {
    var header: String
    var subheader: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(header)
                .font(.system(size: 44, weight: .bold))
                .foregroundColor(Color("color-5"))
            
            if subheader != "" {
                Text(subheader)
                    .font(.system(size: 16, weight: .light))
                    .foregroundColor(Color("color-5"))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            HeaderView(header: "HEADER", subheader: "SUBHEADER")
        }
    }
}
