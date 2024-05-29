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
    @State private var showLaunchView: Bool = true
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().tintColor = UIColor(Color.theme.accent)
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                NavigationStack {
                    HomeView()
                        .toolbar(.hidden, for: .navigationBar)
                }
                .tint(Color.theme.secondaryText)
                .environmentObject(vm)
                
                ZStack {
                    if showLaunchView {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2.0)
            }
        }
    }
}
