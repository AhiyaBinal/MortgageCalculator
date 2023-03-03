//
//  MortgageCalculatorApp.swift
//  MortgageCalculator
//
//  Created by Binal Manek on 2023-03-01.
//

import SwiftUI

@main
struct MortgageCalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: MortgageViewModel())
        }
    }
}
