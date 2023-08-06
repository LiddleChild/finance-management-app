//
//  CategoryCreatingView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 5/8/2566 BE.
//

import SwiftUI

private enum FocusedField {
    case Label, Color
}

struct CategoryCreatingView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var modalvm: ModalViewModel
    
    @StateObject private var vm = CategoryCreatingViewModel()
    @FocusState private var focusField: FocusedField?
    
    var categoryType: String
    
    var body: some View {
        ContentTemplate {
            HeaderView(header: "Create")
            
            SettingList {
                SettingTextField(
                    text: $vm.labelField, placeholder: "Category label")
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
                focusField = nil
                vm.post(categoryType) {
                    modalvm.alertSuccess() { dismiss() }
                } onFailure: { err in
                    modalvm.alertFailure(
                        message: "Fail to create Category!") { dismiss() }
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

struct CategoryCreatingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CategoryCreatingView(categoryType: "INCOME")
                .toolbar(.visible)
        }
    }
}
