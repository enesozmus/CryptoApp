//
//  PreviewProvider.swift
//  CryptoApp
//
//  Created by enesozmus on 25.05.2024.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static let instance: DeveloperPreview = DeveloperPreview()
    // ✅ We can ensure that we can only initialize it from within the class.
    private init() { }
    
    let homeVM: HomeViewModel = HomeViewModel()
    
    let stat1 = StatisticModel(title: "Market Cap", value: "$12.5Bn", percentageChange: 25.34)
    let stat2 = StatisticModel(title: "Total Volume", value: "$1.23Tr")
    let stat3 = StatisticModel(title: "Portfolio Value", value: "$50.4k", percentageChange: -12.34)
    
    let coin: CoinModel = CoinModel(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
        currentPrice: 68864,
        marketCap: 1355095026593,
        marketCapRank: 1,
        fullyDilutedValuation: 1444295104930,
        totalVolume: 30724785335,
        high24H: 69180,
        low24H: 66666,
        priceChange24H: 981.55,
        priceChangePercentage24H: 1.44596,
        marketCapChange24H: 17422229497,
        marketCapChangePercentage24H: 1.30243,
        circulatingSupply: 19703034,
        totalSupply: 21000000,
        maxSupply: 21000000,
        ath: 73738,
        athChangePercentage: -6.5644,
        athDate: "2024-03-14T07:10:36.635Z",
        atl: 67.81,
        atlChangePercentage: 101505.21961,
        atlDate: "2013-07-06T00:00:00.000Z",
        lastUpdated: "2024-05-24T21:51:16.571Z",
        sparklineIn7D: SparklineIn7D(price: [
            66498.19227436287,
            66877.83331688959,
            66912.59223183898,
            66949.22363512292,
            66859.21151675608,
            66770.1031797284,
            67059.07045646293,
            66923.91465295214,
            67076.63868697936,
            66931.30334636591,
            66977.51504189908,
            66851.5381430639,
            66871.23680499768,
            66954.63536623433
        ]),
        priceChangePercentage24HInCurrency: 1.445957836187254,
        currentHoldings: 1.5
    )
}
