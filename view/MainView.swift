//
//  MainView.swift
//  Mortgage
//
//  Created by Jubi on 10/11/23.
//

import SwiftUI

struct MainView: View {
    @State var mortgage = Mortgage()
//    @StateObject var mo = ModelData()
    @State var mort: Mortgage = Mortgage()
    
    var body: some View {
        TabView {
            CalculateView(mortgage: $mortgage)
                .tabItem { Label("", systemImage: "banknote") }
            MoiThangView(mortgage: $mort)
                .tabItem { Label("", systemImage: "dollarsign.arrow.circlepath") }
                .onAppear(perform: {
                    mort = mortgage
                })
        }
        
    }
    
}

#Preview {
    MainView()
}
