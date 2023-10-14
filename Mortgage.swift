//
//  Mortgage.swift
//  Mortgage
//
//  Created by Jubi on 10/5/23.
//

import Foundation

struct Mortgage {
    var house: Double?
    var downPay: Double?
    var loanAmount: Double = 0.0
    var nPayment: Int = 0
    var rate: Double = 0.0
    var tax: Double?
    var taxRate: Double = 0.87
    var baoHiem: Double?
    
    var rateInterestMonthly: Double {
        rate/1200.0
    }
    
    
}



extension Mortgage {
    func tienVayNo() -> Double {
        var tienVay: Double = 0
        tienVay = loanAmount / Double(nPayment)
        return tienVay
    }
    func tienLoi() -> Double {
        var tienLoi: Double = 0.0
        tienLoi = loanAmount * rateInterestMonthly
        return tienLoi
    }
    
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
            thue = (nha * taxRate) / 1200
            return thue
        } else {
            thue = tax ?? 0
        }
        return thue
    }
}
