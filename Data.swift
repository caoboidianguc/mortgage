//
//  Data.swift
//  Mortgage
//
//  Created by Jubi on 10/8/23.
//

import Foundation

struct MonthlyPay {
    var name: String
    var pay: Double
}

var tongThang: [MonthlyPay] = [
    MonthlyPay(name: "principal", pay: 751.0),
    MonthlyPay(name: "tax", pay: 150.0),
    MonthlyPay(name: "baohiem", pay: 73.0),
    MonthlyPay(name: "other", pay: 42.0),
]

