//
//  Color.swift
//  CryptoAPP
//
//  Created by Ivo on 2022/08/24.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secandaryText = Color("SecondaryTextColor")
}
