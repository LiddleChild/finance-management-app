//
//  DropdownListButton.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 21/7/2566 BE.
//

import SwiftUI

struct DropdownListButton: View {
    var option: DropdownOption
    var onSelectingOption: (_ option: DropdownOption) -> Void
    
    var body: some View {
        Button {
            onSelectingOption(option)
        } label: {
            HStack {
                if let imageUrl = option.Image {
                    Image(systemName: imageUrl)
                        .foregroundColor(option.Color ?? Color("color-5"))
                        .scaledToFit()
                } else if let color = option.Color {
                    Circle()
                        .strokeBorder(Color("color-5"), lineWidth: 1)
                        .background(Circle().foregroundColor(color))
                        .scaledToFit()
                }
                
                Text(option.Label)
                    .font(.system(size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .foregroundColor(Color("color-5"))
            .padding(4)
            .frame(height: 28)
        }
    }
}

struct DropdownListButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            DropdownListButton(option: DropdownOption.DUMMY.last!) { _ in }
                .background {
                    Rectangle()
                        .stroke(.white)
                }
        }
    }
}
