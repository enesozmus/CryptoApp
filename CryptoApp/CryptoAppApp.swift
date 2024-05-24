//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by enesozmus on 24.05.2024.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .toolbar(.hidden, for: .navigationBar)
            }
        }
    }
}
