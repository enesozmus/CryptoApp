//
//  SettingsView.swift
//  CryptoApp
//
//  Created by enesozmus on 28.05.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let githubURL = URL(string: "https://github.com/enesozmus")!
    let linkedinURL = URL(string: "https://www.linkedin.com/in/enesozmus")!
    let hackerrankURL = URL(string: "https://www.hackerrank.com/profile/enesozmus")!
    
    let defaultURL = URL(string: "https://www.google.com")!
    let youtubeURL = URL(string: "https://www.youtube.com/c/swiftfulthinking")!
    let coffeeURL = URL(string: "https://www.buymeacoffee.com/nicksarno")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    
    var body: some View {
        NavigationStack {
            ZStack {
                // background
                Color.theme.background.ignoresSafeArea()
                
                // content
                List {
                    developerSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    coinGeckoSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    swiftfulThinkingSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    applicationSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                }
                .navigationBarTitleDisplayMode(.inline)
                .font(.headline)
                .listStyle(.grouped)
                .tint(Color.blue)
            }
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(Color.theme.background, for: .navigationBar)
            .navigationTitle("Settings")
            //.toolbarBackground(.hidden, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    XMarkButton(dismiss: _dismiss)
                        .foregroundColor(Color.theme.secondaryText)
                }
            }
        }
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    SettingsView()
}

extension SettingsView {
    private var developerSection: some View {
        Section {
            HStack {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                Text(" This app was developed by Enes Ozmus. It uses SwiftUI and is written 100% in Swift. The project benefits from multi-threading, publishers/subscribers, and data persistance in Core Data. I am an iOS developer with over four months of experience in developing apps in swift.")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            
            HStack {
                Link("💻 Linkedin", destination: linkedinURL)
                Link("💾 Github", destination: githubURL)
                Link("🌟 Hackerrank", destination: hackerrankURL)
            }
            .font(.callout)
        } header: {
            Text("Developer")
                .foregroundColor(Color.theme.secondaryText)
        }
    }
    private var coinGeckoSection: some View {
        Section {
            HStack {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 130)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text(" The cryptocurrency data that is used in this app comes from a free API from CoinGecko! Prices may be slightly delayed.")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
        } header: {
            Text("CoinGecko")
                .foregroundColor(Color.theme.secondaryText)
        }
    }
    private var swiftfulThinkingSection: some View {
        Section {
            HStack {
                Text(" This app was made by following a @SwiftfulThinking course on YouTube. It uses MVVM Architecture, Combine, and CoreData! The project benefits from multi-threading, publishers/subscribers, and data persistance.")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Subscribe on YouTube 🥳", destination: youtubeURL)
                .font(.callout)
            Link("Support his coffee addiction ☕️", destination: coffeeURL)
                .font(.callout)
        } header: {
            Text("Swiftful Thinking")
                .foregroundColor(Color.theme.secondaryText)
        }
    }
    private var applicationSection: some View {
        Section {
            VStack(alignment: .leading) {
                Link("Terms of Service", destination: defaultURL)
                Link("Privacy Policy", destination: defaultURL)
                Link("Company Website", destination: defaultURL)
                Link("Learn More", destination: defaultURL)
            }
            .font(.callout)
        } header: {
            Text("Application")
                .foregroundColor(Color.theme.secondaryText)
        }
    }
}
