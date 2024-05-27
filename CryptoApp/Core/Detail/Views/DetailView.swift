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
            DetailView(selectedCoin: coin)
        }
    }
}

struct DetailView: View {
    
    let selectedCoin: CoinModel
    
    init(selectedCoin: CoinModel) {
        self.selectedCoin = selectedCoin
        print("Initializing Detail View for \(selectedCoin.name)")
    }
    
    var body: some View {
        Text(selectedCoin.name)
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
    DetailView(selectedCoin: DeveloperPreview.instance.coin)
}
