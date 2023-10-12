//
//  BieuDo.swift
//  Mortgage
//
//  Created by Jubi on 10/8/23.
//

import SwiftUI

struct BieuDo: View {
    var mortgage: Mortgage
    var tongCung: Double {
        mortgage.paymentM() + mortgage.tinhThue() + cungBaoHiem
    }
    var tong: Double
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Monthly payment")
                Text("$ \(tong , specifier: "%1.f")").font(.title)
                HStack{
                    Image(systemName: "circle.circle").foregroundStyle(.blue)
                    Text("Principal & interest").font(.subheadline)
                }
                HStack{
                    Image(systemName: "circle.circle").foregroundStyle(.red)
                    Text("Other").font(.subheadline)
                }
            }
            Spacer()
            ZStack{
                Circle()
                    .rotation(Angle(degrees: -90))
                    .trim(from: 0.005, to: cungPrincipal - 0.005)
                    .stroke(.blue, style: StrokeStyle(lineWidth: 42, lineCap: .butt))
                    .opacity(0.8)
                
                Circle()
                    .rotation(Angle(degrees: -90))
                    .trim(from: cungPrincipal, to: cungThue)
                    .stroke(.red, style: StrokeStyle(lineWidth: 42, lineCap: .butt))
                    .opacity(0.4)
            }
        }
        .padding(.leading)
    }//body
    var cungPrincipal: Double {
       mortgage.paymentM() / tongCung
    }
    var cungThue: Double {
        (mortgage.tinhThue() + mortgage.paymentM() + cungBaoHiem) / tongCung
    }
    var cungBaoHiem: Double {
        mortgage.baoHiem ?? 0.0
    }
   
}

#Preview {
    BieuDo(mortgage: .preview,tong: 2100.1)
}


