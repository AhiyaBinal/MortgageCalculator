//
//  MortgageItem.swift
//  MortgageCalculator
//
//  Created by Binal Manek on 2023-03-02.
//

import SwiftUI

struct MortgageItem: View {
    
    @Binding var doubleValue: Double
    let objMortgageEntity: MortgageEntity
    @StateObject var viewModel: MortgageViewModel
    
    var body: some View {
        switch objMortgageEntity {
        case .PurchasePrice:
            self.showMortgageItem(isPurchasePrice: true, isRateOrDownPayment: false, isYear: false)
        case .DownPayment:
            self.showMortgageItem(isPurchasePrice: false, isRateOrDownPayment: true, isYear: false)
        case .Amortization:
            self.showMortgageItem(isPurchasePrice: false, isRateOrDownPayment: false, isYear: true)
        case .InterestRate:
            self.showMortgageItem(isPurchasePrice: false, isRateOrDownPayment: true, isYear: false)
        }
    }
    
    func showMortgageItem(isPurchasePrice: Bool,isRateOrDownPayment: Bool, isYear: Bool) -> some View {
        var specifier = Constant.specifier
        var info = ""
        var cSign = "$"
        var step : Double.Stride = 0.1
        if isYear {
            specifier = Constant.yearSpecifier
            info = " Years"
            cSign = ""
            step = 5
        }
        else if isRateOrDownPayment {
            info = " %"
            cSign = ""
        }

        return VStack(alignment: .leading) {
            let itemTitle = isPurchasePrice ? "" : cSign + String(format: specifier, doubleValue) + info
            Text("\(objMortgageEntity.strValue): \(itemTitle)")
                .font(.custom(Constant.fontName, size: Constant.fontSize))
                .fontWeight(.bold)
            if isPurchasePrice {
                TextField(objMortgageEntity.strValue, value: $doubleValue, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 10)
                    .onChange(of: doubleValue) { newValue in
                        viewModel.calculateMortgage()
                    }
            }
            else {
                Slider(value: $doubleValue, in: objMortgageEntity.range, step: step)
                    .padding(.bottom)
                    .accentColor(.gray)
                    .onChange(of: doubleValue) { newValue in
                        viewModel.calculateMortgage()
                    }
            }
        }
    }
}
