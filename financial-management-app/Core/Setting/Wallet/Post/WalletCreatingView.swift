//
//  WalletCreatingView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 4/8/2566 BE.
//

import SwiftUI

private enum FocusedField {
    case Label, Color
}

struct WalletCreatingView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var modalvm: ModalViewModel
    
    @StateObject private var vm = WalletCreatingViewModel()
    @FocusState private var focusField: FocusedField?
    
    var body: some View {
        ContentTemplate {
            HeaderView(header: "Create")
            
            SettingList {
                SettingTextField(
                    text: $vm.labelField, placeholder: "Wallet label")
                .focused($focusField, equals: .Label)
                    .autocapitalization(.none)
                
                ColorPicker(
                    "Color",
                    selection: $vm.colorField,
                    supportsOpacity: false)
                .focused($focusField, equals: .Color)
            }
            .font(.system(size: 20))
            .onAppear {
                focusField = FocusedField.Label
            }
            
            Button {
                vm.post {
                    modalvm.alertSuccess() {
                        dismiss()
                    }
                } onFailure: { err in
                    modalvm.alertFailure(message: "Fail to create Wallet!") {
                        dismiss()
                    }
                }
            } label: {
                Text("Create")
                    .foregroundColor(Color.color5)
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }
            .background(RoundedRectangle(cornerRadius: 12)
                .foregroundColor(vm.isFormFilled() ? Color.color4 : Color.gray))
            .padding(.top, 12)
            
            Spacer()
        }
        .modifier(NagivationDismissModier())
    }
}

struct WalletCreatingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            WalletCreatingView()
                .toolbar(.visible)
        }
    }
}
