//
//  MoiThangView.swift
//  Mortgage
//
//  Created by Jubi on 11/13/23.
//

import SwiftUI
struct MoiThangView: View {
    @Binding var mortgage: Mortgage
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(mortgage.thangBill, id: \.loanAmount){ mort in
                    PaymentViewRow(mortgage: mort)
                        .padding(12)
                }
            }
            .task {
                mortgage.thangBill = await mortgage.traTheoThang()
            }
            .listStyle(.plain)
            .navigationTitle(Text("Monthly - Pay - Interest - Princ - Loan"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }//body
    
}

#Preview {
    MoiThangView(mortgage: .constant(.preview))
}

