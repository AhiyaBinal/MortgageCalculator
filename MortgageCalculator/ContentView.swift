//
//  ContentView.swift
//  MortgageCalculator
//
//  Created by Binal Manek on 2023-03-01.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: MortgageViewModel
    var body: some View {
       
        VStack(alignment: .leading) {
            Text(Constant.title)
                .font(.custom(Constant.fontName, size: Constant.titleSize))
                .fontWeight(.bold)
                .padding([.bottom, .top],30)
            Group {
                MortgageItem(doubleValue: $viewModel.purchasePrice, objMortgageEntity: .PurchasePrice, viewModel: viewModel)
                MortgageItem(doubleValue: $viewModel.downPayment, objMortgageEntity: .DownPayment, viewModel: viewModel)
                MortgageItem(doubleValue: $viewModel.amortization, objMortgageEntity: .Amortization, viewModel: viewModel)
                MortgageItem(doubleValue: $viewModel.interestRate, objMortgageEntity: .InterestRate, viewModel: viewModel)
            }
            HStack(alignment: .center) {
                Text(Constant.iType)
                    .font(.custom(Constant.fontName, size: Constant.fontSize))
                    .fontWeight(.bold)
                InstallmentType(viewModel: viewModel)
            }.padding(.bottom,10)
            self.commonText(title: Constant.loanAmount, amount: viewModel.loanAmount)
            self.commonText(title: Constant.installment, amount: viewModel.monthlyEMI)
            Spacer()
        }
        .padding()
    }
    func commonText(title: String, amount: Double) -> some View {
       return Text("\(title) \(amount, specifier: Constant.specifier)")
            .font(.custom(Constant.fontName, size: Constant.titleSize))
    }
}
