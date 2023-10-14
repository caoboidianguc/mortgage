//
//  SliderRateView.swift
//  Mortgage
//
//  Created by Jubi on 10/11/23.
//

import SwiftUI

struct SliderRateView: View {
    @Binding var dieuChinh: Double
    var body: some View {
        Slider(value: $dieuChinh,
               in: 0.3...2.5,
               step: 0.1,
               label: {
            Text("Rate interest")
        }, minimumValueLabel: {
            Text("\(dieuChinh, specifier: "%.2f")%")
        }) {
            Text("2.5%")
        }
        
    }
}

#Preview {
    SliderRateView(dieuChinh: .constant(1.5))
}
