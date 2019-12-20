//
//  MortgageController.swift
//  Mortgage Calculator
//
//  Created by Seschwan on 12/19/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import Foundation

class MortgageController {
    
    func calculateMortgagePayments(principalAmount: Double, downPayment: Double, interestRate: Double, termLength: Double) -> Double {
        let interestRatePercentage = interestRate / (12 * 100)
        let totalPaymentsCount = termLength * 12
        
        let firstStep = interestRatePercentage * pow(1 + interestRatePercentage, totalPaymentsCount)
        let secondStep = pow(1 + interestRatePercentage, totalPaymentsCount) - 1
        let result = firstStep / secondStep
        let adjustedPrice = principalAmount - downPayment
        
        let monthlyPayment = adjustedPrice * result
        
        return monthlyPayment.rounded()
    }
}
