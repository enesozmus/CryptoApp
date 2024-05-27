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
    @Published var statistics: [StatisticModel] = []
    
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false
    
    private let coinService: CoinDataService = CoinDataService()
    private let portfolioService: PortfolioDataService = PortfolioDataService()
    private let marketService: MarketDataService = MarketDataService()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    // MARK: Function - Subscribers
    func addSubscribers() {
        
        // 🟥 updates allCoins
        $searchText
            .combineLatest(coinService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        // 🟥 update portfolioCoins
        $allCoins
            .combineLatest(portfolioService.$savedEntities)
            .map(mapAllCoinsToPortfolioCoins)
            .sink { [weak self] (returnedCoins) in
                guard let self = self else { return }
                self.portfolioCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        // 🟥 updates marketData
        marketService.$marketData
            .combineLatest($portfolioCoins)
            .map(mapGlobalMarketData)
            .sink { [weak self] (returnedStatistics) in
                self?.statistics = returnedStatistics
                self?.isLoading = false
            }
            .store(in: &cancellables)
    }
    
    // MARK: Other Functions
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return coins
        }
        let lowercasedText = text.lowercased()
        return coins.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(lowercasedText) ||
            coin.symbol.lowercased().contains(lowercasedText) ||
            coin.id.lowercased().contains(lowercasedText)
        }
    }
    private func mapAllCoinsToPortfolioCoins(allCoins: [CoinModel], portfolioEntities: [PortfolioEntity]) -> [CoinModel] {
        allCoins
            .compactMap { (coin) -> CoinModel? in
                guard let entity = portfolioEntities.first(where: { $0.coinID == coin.id }) else {
                    return nil
                }
                return coin.updateHoldings(amount: entity.amount)
            }
    }
    private func mapGlobalMarketData(marketDataModel: MarketDataModel?, portfolioCoins: [CoinModel]) -> [StatisticModel] {
        var stats: [StatisticModel] = []
        
        guard let data = marketDataModel else {
            return stats
        }
        
        let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = StatisticModel(title: "24h Volume", value: data.volume)
        let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
        
        let portfolioValue = portfolioCoins
                                .map({ $0.currentHoldingsValue })
                                .reduce(0, +)
        
        let previousValue = portfolioCoins
                                .map { (coin) -> Double in
                                    let currentValue = coin.currentHoldingsValue
                                    let percentChange = coin.priceChangePercentage24H ?? 0 / 100
                                    let previousValue = currentValue / (1 + percentChange)
                                    return previousValue
                                }
                                .reduce(0, +)
        
        let percentageChange = ((portfolioValue - previousValue) / previousValue)
        
        let portfolio = StatisticModel(
                                title: "Portfolio Value",
                                value: portfolioValue.asCurrencyWith2Decimals(),
                                percentageChange: percentageChange)
        
        stats.append(contentsOf: [
            marketCap,
            volume,
            btcDominance,
            portfolio
        ])
        return stats
    }
    func updatePortfolio(coin: CoinModel, amount: Double) {
        portfolioService.updatePortfolio(coin: coin, amount: amount)
    }
    func reloadData() {
        isLoading = true
        coinService.getCoins()
        marketService.getMarketData()
        HapticManager.notification(type: .success)
    }
}
