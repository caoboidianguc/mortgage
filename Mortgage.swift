//
//  Mortgage.swift
//  Mortgage
//
//  Created by Jubi on 10/5/23.
//

import Foundation

//class MortgageCal: ObservableObject {
//    @Published var mortgage: Mortgage = Mortgage(loanAmount: 0.0, nPayment: 0, rate: 0.0)
//}
struct Mortgage {
    var house: Double?
    var loanAmount: Double = 0.0
    var nPayment: Int = 0
    var rate: Double = 0.0
    var tax: Double?
    var baoHiem: Double?
//    init(loanAmount: Double, nPayment: Int, rate: Double) {
//        self.loanAmount = loanAmount
//        self.nPayment = nPayment
//        self.rate = rate
//    }
    var rateInterestMonthly: Double {
        rate/1200.0
    }
    
    
}



extension Mortgage {
    
    var phanTuSo: Decimal {
         1 + Decimal(rateInterestMonthly)
    }
    func tuSo() -> Double {
        var soTim: Double = 0.0
        soTim = Double(truncating: pow(phanTuSo, nPayment) as NSDecimalNumber)
        
        return soTim * rateInterestMonthly
    }
    
    
    var phanMauso: Decimal {
        1 + Decimal(rateInterestMonthly)
    }
    
    func mauSo() -> Double {
        var soTim: Double = 0.0
        soTim = Double(truncating: pow(phanMauso, nPayment) as NSDecimalNumber)
        
        return soTim - 1
    }
    
    func paymentM() -> Double {
        var thuong: Double = 0
        thuong = tuSo()/mauSo()
        
        return thuong * loanAmount
    }
    
    static var preview: Mortgage = Mortgage(loanAmount: 155000.0, nPayment: 360, rate: 4.125)
    
    func tinhThue() -> Double {
        let nha = house ?? 0
        var thue: Double = 0
        if tax == nil {
            thue = (nha * 0.87) / 1200
            return thue
        } else {
            thue = tax ?? 0
        }
        return thue
    }
}
