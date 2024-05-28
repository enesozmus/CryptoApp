//
//  Color.swift
//  CryptoApp
//
//  Created by enesozmus on 24.05.2024.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
    static let launchTheme = LaunchTheme()
}
struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("CustomGreenColor")
    let red = Color("CustomRedColor")
    let secondaryText = Color("SecondaryTextColor")
}
struct LaunchTheme {
    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
}
