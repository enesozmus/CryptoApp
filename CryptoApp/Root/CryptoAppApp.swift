//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by enesozmus on 24.05.2024.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    
    @StateObject var vm: HomeViewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .toolbar(.hidden, for: .navigationBar)
            }
            .environmentObject(vm)
        }
    }
}
