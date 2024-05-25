//
//  HomeStatsView.swift
//  CryptoApp
//
//  Created by enesozmus on 25.05.2024.
//

import SwiftUI

struct HomeStatisticView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack {
            ForEach(vm.statistics) { statistic in
                StatisticView(statisticModel: statistic)
                    .frame(width: UIScreen.main.bounds.width / 3)
                    .offset(x: showPortfolio ? 0 : -12)
            }
        }
        .frame(width: UIScreen.main.bounds.width,
               alignment: showPortfolio ? .trailing : .leading
        )
    }
}

#Preview {
    HomeStatisticView(showPortfolio: .constant(false))
        .environmentObject(DeveloperPreview.instance.homeVM)
}
