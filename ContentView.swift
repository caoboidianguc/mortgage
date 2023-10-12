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
    @Binding var mortgage: Mortgage
    @State private var nPayment = ""
    @State private var rate = ""
    
    var body: some View {
            VStack  {
                Section(content: {
                    HStack {
                        Text("Home:")
                        TextField(value: $mortgage.house, format: .number, label: {Text("Home price")})
                            .keyboardType(.numberPad)
                    }
                    HStack{
                        Text("Down pay:")
                        TextField(value: $mortgage.downPay, format: .number, label: {Text("Down payment")})
                            .keyboardType(.numberPad)
                            .onChange(of: mortgage.downPay, perform:  { _ in
                                if let num = mortgage.downPay {
                                    if num > 10 {cal()}}
                            })
                    }
                    HStack{
                        Text("In years:")
                        TextField("Loan term, years", text: $nPayment)
                            .keyboardType(.numberPad)
                    }
                    HStack {
                        Text("Rate:")
                        TextField("Interest rate", text: $rate)
                            .keyboardType(.decimalPad)
                            .onChange(of: rate, perform:  { _ in
                                    cal()
                            })
                    }
                                        
                })
                Section("Property tax monthly", content: {
//                    TextField(value: $mortgage.tax, format: .number, label: {Text("Tax adjust?")})
//                        .keyboardType(.numbersAndPunctuation)
                    SliderRateView(dieuChinh: $mortgage.taxRate)
                    TextField(value: $mortgage.baoHiem, format: .number, label: {Text("Insurance and other")})
                        .keyboardType(.numbersAndPunctuation)
                    Text("Payment included $\(mortgage.tinhThue(), specifier: "%.1f") tax, other $ \(baoHiem(), specifier: "%.1f")")
    //                    Text("$ \(payment , specifier: "%1.f")")
                        .padding([.bottom], 50)
                    
                })
            }.padding()
                .listStyle(.automatic)
                .toolbar(content: {
                    ToolbarItem(placement: .topBarTrailing, content: {
                        Button("Reset", action: {
                            mortgage.house = nil
                            mortgage.downPay = nil
                            nPayment = ""
                            rate = ""
                        })
                    })
                })
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
        let down = mortgage.downPay,
           let pay = Int(nPayment),
           let rate = Double(rate) {
            let loan = nha - down
            mortgage.loanAmount = loan
            mortgage.nPayment = pay * 12
            mortgage.rate = rate
        }
    }
 
}

#Preview {
    ContentView(mortgage: .constant(.preview))
}



