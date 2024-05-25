//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by enesozmus on 25.05.2024.
//

import Combine
import Foundation

// ✅ As we move around this app you'll see most of the screens in this app correlate to the same data source.
// ✅ And because of that we're going to share this view model across a lot of the views that we make in our app.
// go to root folder
class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    private let coinService: CoinDataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        coinService.$allCoins
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
}
