//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by enesozmus on 25.05.2024.
//

import Foundation

// ✅ As we move around this app you'll see most of the screens in this app correlate to the same data source.
// ✅ And because of that we're going to share this view model across a lot of the views that we make in our app.
// go to root folder 
class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.allCoins.append(DeveloperPreview.instance.coin)
            self.allCoins.append(DeveloperPreview.instance.coin)
            self.portfolioCoins.append(DeveloperPreview.instance.coin)
        }
    }
}
