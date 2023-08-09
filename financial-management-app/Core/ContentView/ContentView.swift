//
//  ContentView.swift
//  financial-management-app
//
//  Created by Thanapat Ussawanarong on 18/6/2566 BE.a
//
/*
 Loading screen
 */
import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = ContentViewModel()
    var body: some View {
        ContentView()
            .foregroundColor(.color5)
            .transition(.scale)
            .animation(.easeInOut(duration: 1.5), value: vm.status)
    }
    
    func ContentView() -> AnyView {
        switch vm.status {
        case .Loading: return AnyView(LoadingView().id("Loading"))
        case .Connection: return AnyView(MainView().id("Connection"))
        case .NoConnection: return AnyView(NoConnectionView().id("NoConnection"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
