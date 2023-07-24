//
//  ContentView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 18/6/2566 BE.a
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            HomeView()
                .environmentObject(ViewModel())
                .environmentObject(ModalViewModel.shared)
            
            Modal()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
