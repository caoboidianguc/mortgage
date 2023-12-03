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
                        Text("Fixed years:")
                        TextField("Loan term", text: $nPayment)
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
                    HStack{
                        Text("Insurance & other:")
                        TextField(value: $mortgage.baoHiem, format: .number, label: {Text("Amount")})
                            .keyboardType(.numbersAndPunctuation)
                    }
                    Text("You should consider Mortgage insurance and House insurance")
                        .font(.subheadline)
                        .padding([.bottom], 50)
                    
                })
            }
            .padding()
                .listStyle(.automatic)
                .toolbar(content: {
                    ToolbarItem(placement: .keyboard, content: {
                        Button("Done", action: {
                            UIApplication.shared.endKey()
                        })
                    })
                    ToolbarItem(placement: .topBarTrailing, content: {
                        Button("Reset", action: {
                            mortgage.house = nil
                            mortgage.downPay = nil
                            mortgage.loanAmount = 0.0
                            mortgage.baoHiem = nil
                            mortgage.rate = 0.0
                            nPayment = ""
                            rate = ""
                        })
                    })
                })
        
    }//body
   

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



extension UIApplication {
    func endKey(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
