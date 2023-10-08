//
//  ContentView.swift
//  Mortgage
//
//  Created by Jubi on 10/5/23.
//
import Foundation
import SwiftUI
//@available(iOS 17.0, *)
struct ContentView: View {
    @State private var mortgage: Mortgage = Mortgage()
//    @State private var house = ""
    @State private var downP = ""
    @State private var loanAmount = ""
    @State private var nPayment = ""
    @State private var rate = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section(content: {
//                    TextField("Home price", text: $house)
                    TextField(value: $mortgage.house, format: .number, label: {Text("Home price")})
                    TextField("Down payment", text: $downP)
                    TextField("Loan term, years", text: $nPayment)
                    TextField("Interest rate", text: $rate)
                        .onChange(of: rate, perform:  { _ in
                                cal()
                        })
                                        
                })
                Section("Monthly", content: {
    //                Text("Payments")
                    
                    TextField(value: $mortgage.tax, format: .number, label: {Text("Tax adjust?")})
                        
                    TextField(value: $mortgage.baoHiem, format: .number, label: {Text("Insurance")})
                    Text("Payment included $\(mortgage.tinhThue(), specifier: "%1.f") tax, $ \(baoHiem(), specifier: "%1.f") other")
                    Text("$ \(payment , specifier: "%1.f")")
                    
                    
                })
            }
            .listStyle(.plain)
            .navigationTitle("Mortgage Preview")
    //        .onChange(of: rate){
    //            cal()
    //        }
            
        }
    }//body
    var payment: Double {
        mortgage.paymentM() + mortgage.tinhThue() + baoHiem()
    }
    
    func baoHiem() -> Double {
        guard let baohiem = mortgage.baoHiem else {return 0.0}
        return baohiem
    }

    func cal(){
        if let nha = mortgage.house,
        let down = Double(downP),
           let pay = Int(nPayment),
           let rate = Double(rate) {
            let loan = nha - down
            mortgage.loanAmount = loan
            mortgage.nPayment = pay * 12
            mortgage.rate = rate
        }
    }
    
//    func tinhThue() -> Double {
//        var nha = mortgage.house ?? 0
//        var thue: Double = 0
//        if mortgage.tax == nil {
//            thue = (nha * 0.87) / 1200
//            return thue
//        } else {
//            thue = mortgage.tax ?? 0
//        }
//        return thue
//    }
//    func tinhThue() -> Double{
//        var thue: Double = 0
//        if mortgage.tax == nil{
//            if let nha = Double(house){
//                thue = (nha * 0.87) / 1200
//            }
//            return thue
//        } else {
//            thue = mortgage.tax ?? 0
//        }
//        return thue
//    }
}

#Preview {
    ContentView()
}



