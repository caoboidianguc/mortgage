//
//  PaymentViewRow.swift
//  Mortgage
//
//  Created by Jubi on 11/13/23.
//

import SwiftUI

struct PaymentViewRow: View {
    var mortgage: Mortgage
   
    var body: some View {
        HStack {
            Text("\(mortgage.billNum)")
                .font(.headline)
            VStack(alignment: .center) {
                Text("$ \(mortgage.payment , specifier: "%1.f")")
                    .foregroundStyle(.blue)
                Text("Payment").font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            VStack(alignment: .center) {
                Text("$ \(mortgage.tienLoi() , specifier: "%1.f")")
                    .foregroundStyle(.green)
                Text("Interest").font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            VStack(alignment: .center){
                Text("$ \(principal , specifier: "%1.f")")
                    .foregroundStyle(.mint)
                Text("Principal").font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            VStack(alignment: .center) {
                Text("$ \(mortgage.loanAmount , specifier: "%1.f")")
                    .foregroundStyle(.red)
                Text("Loan").font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }//body
    var principal: Double {mortgage.paymentM() - mortgage.tienLoi()}
}

#Preview {
    PaymentViewRow(mortgage: .preview)
}



//tinh cong thuc ben nay
