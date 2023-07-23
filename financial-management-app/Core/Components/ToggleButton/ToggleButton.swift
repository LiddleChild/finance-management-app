//
//  ToggleButton.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 23/7/2566 BE.
//

import SwiftUI

struct ToggleButton: View {
    var states: [ToggleButtonState]
    @Binding var value: Bool
    
    var body: some View {
        Button {
            withAnimation {
                value.toggle()
            }
        } label: {
            HStack {
                if !value {
                    Text(verbatim: states[0].Label)
                        .foregroundColor(states[0].ActiveColor ?? Color("color-4"))
                        .font(.system(size: 20, weight: .bold))
                } else {
                    Text(verbatim: states[0].Label)
                        .foregroundColor(Color("color-2"))
                        .font(.system(size: 12, weight: .regular))
                }
                
                Spacer()
                
                if value {
                    Text(verbatim: states[1].Label)
                        .foregroundColor(states[1].ActiveColor ?? Color("color-4"))
                        .font(.system(size: 20, weight: .bold))
                } else {
                    Text(verbatim: states[1].Label)
                        .foregroundColor(Color("color-2"))
                        .font(.system(size: 12, weight: .regular))
                }
            }
            .foregroundColor(Color("color-5"))
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color("color-2"))
            }
        }
    }
}

private struct Preview: View {
    @State var state: Bool = false
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("color-1"))
                .ignoresSafeArea()
            
            ToggleButton(states: ToggleButtonState.DUMMY,
                         value: $state)
            .padding(.horizontal, 24)
        }
    }
}

struct ToggleButton_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
    }
}
