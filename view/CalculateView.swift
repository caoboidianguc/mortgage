//
//  CalculateView.swift
//  Mortgage
//
//  Created by Jubi on 11/14/23.
//

import SwiftUI

struct CalculateView: View {
    @Binding var mortgage: Mortgage
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ContentView(mortgage: $mortgage)
                BieuDo(mortgage: mortgage)
                    .opacity((mortgage.rate == 0.0 ? 0.0 : 0.7))
//                    .offset(y: -250)
                
            }.navigationTitle("Mortgage Preview")
                
        }
    }
}

#Preview {
    CalculateView(mortgage: .constant(.preview))
}
