//
//  MainView.swift
//  Mortgage
//
//  Created by Jubi on 10/11/23.
//

import SwiftUI

struct MainView: View {
    @State private var mortgage = Mortgage()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ContentView(mortgage: $mortgage)
                
                BieuDo(mortgage: mortgage, tong: payment)
                    .opacity((mortgage.rate == 0.0 ? 0.0 : 0.7))
//                    .offset(y: -250)
                
            }.navigationTitle("Mortgage Preview")
                
        }
    }
    
    var payment: Double {
        mortgage.paymentM() + mortgage.tinhThue() + baoHiem()
    }
    func baoHiem() -> Double {
        guard let baohiem = mortgage.baoHiem else {return 0.0}
        return baohiem
    }
}

#Preview {
    MainView()
}
