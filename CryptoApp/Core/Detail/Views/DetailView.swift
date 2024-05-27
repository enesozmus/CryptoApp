//
//  DetailView.swift
//  CryptoApp
//
//  Created by enesozmus on 27.05.2024.
//

import SwiftUI

struct DetailLoadingView: View {
    
    @Binding var selectedCoin: CoinModel?
    
    var body: some View {
        if let coin = selectedCoin {
            DetailView(coin: coin)
        }
    }
}

struct DetailView: View {
    
    @StateObject private var vm: DetailViewModel
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
        print("Initializing Detail View for \(coin.name)")
    }
    
    var body: some View {
        if let coinDescription = vm.coinDescription,
           !coinDescription.isEmpty {
            Text(coinDescription)
        }
    }
    
    //    @Binding var selectedCoin: CoinModel?
    //
    //    init(selectedCoin: Binding<CoinModel?>) {
    //        self._selectedCoin = selectedCoin
    //        print("Initializing Detail View for \(selectedCoin.wrappedValue?.name ?? "lazyLoading works")")
    //    }
    //
    //    var body: some View {
    //        if let coin = selectedCoin {
    //            Text(coin.name)
    //        }
    //    }
}

#Preview {
    DetailView(coin: DeveloperPreview.instance.coin)
}
