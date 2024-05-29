//
//  PortfolioView.swift
//  CryptoApp
//
//  Created by enesozmus on 26.05.2024.
//

import SwiftUI

struct ManagePortfolioView: View {
    
    // MARK: Properties
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var vm: HomeViewModel
    
    @State private var selectedCoin: CoinModel? = nil
    @State private var quantityText: String = ""
    @State private var showCheckmark: Bool = false
    
    // MARK: BODY
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    SearchBarView(searchText: $vm.searchText)
                    coinLogoList
                    if selectedCoin != nil {
                        portfolioInputSection
                    }
                }
                .navigationTitle("Edit Portfolio")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        XMarkButton(dismiss: _dismiss)
                            .onDisappear {
                                vm.searchText = ""
                            }
                            .foregroundColor(Color.theme.secondaryText)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        trailingNavBarButtons
                    }
                }
                .onChange(of: vm.searchText) {
                    if vm.searchText == "" {
                        removeSelectedCoin()
                    }
                }
            }
            .background(Color.theme.background.ignoresSafeArea())
        }
    }
}

// MARK: Preview
#Preview {
    ManagePortfolioView()
        .environmentObject(DeveloperPreview.instance.homeVM)
}

// MARK: Extension
extension ManagePortfolioView {
    // MARK: Views
    private var coinLogoList: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 8) {
                ForEach(vm.searchText.isEmpty ? vm.portfolioCoins : vm.allCoins) { coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                updateSelectedCoin(coin: coin)
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(selectedCoin?.id == coin.id ? Color.theme.green : Color.clear, lineWidth: 1)
                        )
                }
            }
            .frame(height: 115)
            .padding(.leading)
        }
    }
    private var portfolioInputSection: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Current price of \(selectedCoin?.symbol.uppercased() ?? ""):")
                Spacer()
                Text(selectedCoin?.currentPrice.asCurrencyWith6Decimals() ?? "")
            }
            Divider()
            HStack {
                Text("Amount holding:")
                Spacer()
                TextField("Ex: 1.4", text: $quantityText)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            Divider()
            HStack {
                Text("Current value:")
                Spacer()
                Text(getCurrentValue().asCurrencyWith2Decimals())
            }
        }
        .foregroundStyle(Color.theme.secondaryText)
        .animation(.none, value: selectedCoin?.id)
        .padding()
        .font(.headline)
    }
    private var trailingNavBarButtons: some View {
        HStack(spacing: 10) {
            Image(systemName: "checkmark")
                .opacity(showCheckmark ? 1.0 : 0.0)
            Button {
                saveButtonPressed()
            } label: {
                Text("Save".uppercased())
                    .foregroundColor(Color.theme.secondaryText)
            }
            .opacity(
                (selectedCoin != nil && selectedCoin?.currentHoldings != Double(quantityText.replacingOccurrences(of: ",", with: ".")))
                ? 1.0
                : 0.0
            )
        }
        .font(.headline)
    }
    
    
    // MARK: Functions
    private func updateSelectedCoin(coin: CoinModel) {
        selectedCoin = coin
        
        if let portfolioCoin = vm.portfolioCoins.first(where: { $0.id == coin.id }),
           let amount = portfolioCoin.currentHoldings {
            quantityText = "\(amount)"
        } else {
            quantityText = ""
        }
    }
    
    
    private func getCurrentValue() -> Double {
        if let quantity = Double(quantityText.replacingOccurrences(of: ",", with: ".")) {
            return quantity * (selectedCoin?.currentPrice ?? 0)
        }
        return 0.0
    }
    
    
    private func saveButtonPressed() {
        guard
            let coin = selectedCoin,
            let amount = Double(quantityText.replacingOccurrences(of: ",", with: "."))
        else { return }
        
        // save to portfolio
        vm.updatePortfolio(coin: coin, amount: amount)
        
        // show checkmark
        withAnimation(.easeIn) {
            showCheckmark = true
            removeSelectedCoin()
        }
        // hide keyboard
        UIApplication.shared.endEditing()
        
        // hide checkmark
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeOut) {
                showCheckmark = false
            }
        }
    }
    
    
    private func removeSelectedCoin() {
        selectedCoin = nil
        vm.searchText = ""
    }
}
