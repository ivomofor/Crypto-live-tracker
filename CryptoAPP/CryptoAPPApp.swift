//
//  CryptoAPPApp.swift
//  CryptoAPP
//
//  Created by Ivo on 2022/08/24.
//

import SwiftUI

@main
struct CryptoAPPApp: App {
    
    @StateObject var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
