//
//  InstallmentType.swift
//  MortgageCalculator
//
//  Created by Binal Manek on 2023-03-03.
//

import SwiftUI

struct InstallmentType: View {
    @State private var showingOptions = false
    @StateObject var viewModel: MortgageViewModel

    var body: some View {
           VStack {
               Button(viewModel.paymentType) {
                   showingOptions = true
               }
               .confirmationDialog("", isPresented: $showingOptions, titleVisibility: .visible) {
                   ForEach(PaymentFrequency.allCases, id: \.numberOfInstallment) { item in
                       Button(action: {
                           viewModel.paymentType = String(describing: item)
                           viewModel.numOfInstallments = item.numberOfInstallment
                           viewModel.calculateMortgage()
                       }) {
                           Text(String(describing: item))
                       }
                   }
               }
           }
       }
}
