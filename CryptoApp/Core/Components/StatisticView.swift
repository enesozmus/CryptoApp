//
//  StatisticView.swift
//  CryptoApp
//
//  Created by enesozmus on 25.05.2024.
//

import SwiftUI

struct StatisticView: View {
    
    let statisticModel: StatisticModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(statisticModel.title)
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
            Text(statisticModel.value)
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(
                        Angle( degrees: (statisticModel.percentageChange ?? 0) >= 0 ? 0 : 180)
                    )
                Text(statisticModel.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundStyle((statisticModel.percentageChange ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
            .opacity(statisticModel.percentageChange == nil ? 0.0 : 1.0)
        }
    }
}

#Preview {
    StatisticView(statisticModel: DeveloperPreview.instance.stat1)
}
