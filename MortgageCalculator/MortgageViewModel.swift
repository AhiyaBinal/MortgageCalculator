//
//  MortgageViewModel.swift
//  MortgageCalculator
//
//  Created by Binal Manek on 2023-03-02.
//

import Foundation

class MortgageViewModel: ObservableObject {
    @Published var purchasePrice: Double = 0
    @Published var downPayment: Double = 0
    @Published var amortization: Double = 5
    @Published var interestRate: Double = 0
    @Published var monthlyEMI: Double = 0
    @Published var loanAmount: Double = 0
    @Published var paymentType: String = String(describing: PaymentFrequency.Monthly)
    @Published var numOfInstallments: Int = PaymentFrequency.Monthly.numberOfInstallment
    var specifier = Constant.specifier
    var info = ""
    var cSign = "$"
    var step : Double.Stride = 0.1
    
    func calculateMortgage() {
        //Formula : M = P [ i(1 + i)^n ] / [ (1 + i)^n – 1]
        let calculateDown = (purchasePrice * downPayment) / 100
        loanAmount = purchasePrice - calculateDown 
        let totalInstallments = amortization * 12
        let rateOfInterestPerMonth = interestRate / (Double(numOfInstallments) * 100)
        
        let value1 = pow(1 + rateOfInterestPerMonth, totalInstallments)
        
        let upperPart = rateOfInterestPerMonth * value1
        let lowerPart = value1 - 1
        
        monthlyEMI = loanAmount * (upperPart / lowerPart)
    }
}
