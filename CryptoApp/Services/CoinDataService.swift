//
//  CoinDataService.swift
//  CryptoApp
//
//  Created by enesozmus on 25.05.2024.
//

import Combine
import Foundation

class CoinDataService {
    
    @Published var allCoins: [CoinModel] = []
    var coinSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    func getCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return }
        
        coinSubscription = NetworkingManager.download(url: url, convertTo: [CoinModel].self)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: NetworkingManager.handleCompletion,
                receiveValue: { [weak self] (returnedCoins) in
                    self?.allCoins = returnedCoins
                    self?.coinSubscription?.cancel()
                })
        
        //        coinSubscription = NetworkingManager.download(url: url)
        //            .decode(type: [CoinModel].self, decoder: JSONDecoder())
        //            .receive(on: DispatchQueue.main)
        //            .sink(
        //                receiveCompletion: NetworkingManager.handleCompletion,
        //                receiveValue: { [weak self] (returnedCoins) in
        //                    self?.allCoins = returnedCoins
        //                    self?.coinSubscription?.cancel()
        //            })
        
        //        coinSubscription = URLSession.shared.dataTaskPublisher(for: url)
        //            .subscribe(on: DispatchQueue.global(qos: .default))
        //            .tryMap { (output) -> Data in
        //                guard let response = output.response as? HTTPURLResponse,
        //                      response.statusCode >= 200 && response.statusCode < 300 else {
        //                    throw URLError(.badServerResponse)
        //                }
        //                return output.data
        //            }
        //            .receive(on: DispatchQueue.main)
        //            .decode(type: [CoinModel].self, decoder: JSONDecoder())
        //            .sink { (completion) in
        //                switch completion {
        //                case .finished:
        //                    break
        //                case .failure(let error):
        //                    print(error.localizedDescription)
        //                }
        //            } receiveValue: { [weak self] (returnedCoins) in
        //                self?.allCoins = returnedCoins
        //                self?.coinSubscription?.cancel()
        //            }
    }
}
