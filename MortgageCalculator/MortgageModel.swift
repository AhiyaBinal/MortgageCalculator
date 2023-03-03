//
//  Constant.swift
//  MortgageCalculator
//
//  Created by Binal Manek on 2023-03-02.
//

import Foundation


enum MortgageEntity {

    case PurchasePrice
    case DownPayment
    case Amortization
    case InterestRate
    
    var strValue: String {
        switch self {
        case .PurchasePrice: return Constant.price
        case .DownPayment: return Constant.downAmount
        case .Amortization: return Constant.years
        case .InterestRate: return Constant.rate
        }
    }
    var range: ClosedRange<Double> {
        switch self {
        case .PurchasePrice: return Constant.priceRange
        case .DownPayment: return Constant.priceRange
        case .Amortization: return Constant.yearRange
        case .InterestRate: return Constant.rateRange
        }
    }
}
enum PaymentFrequency: CaseIterable {
    case Monthly
    case SemiMonthly
    case BiWeekly
    case Weekly
     
    var numberOfInstallment: Int {
        switch self {
        case .Weekly: return Constant.weekly
        case .BiWeekly: return Constant.biweekly
        case .SemiMonthly: return Constant.semimonthly
        case .Monthly: return Constant.monthly
        }
    }
}
struct Constant {
    static let title = "Mortgage calculator"
    static let fontName = "Times New Roman"
    static let price = "Purchase Price"
    static let downAmount = "Down Payment"
    static let years = "Amortization"
    static let rate = "Interest Rate"
    static let loanAmount = "Loan Amount: $"
    static let installment = "Installment Amount: $"
    static let specifier = "%.1f"
    static let yearSpecifier = "%.0f"
    static let iType = "Change Installment Type: "
    
    static let weekly = 52
    static let biweekly = 26
    static let semimonthly = 24
    static let monthly = 12

    static let titleSize = 30.0
    static let fontSize = 20.0
    
    static let priceRange: ClosedRange<Double> = 0...100
    static let yearRange: ClosedRange<Double> = 5...30
    static let rateRange:ClosedRange<Double> = 0...30

}
