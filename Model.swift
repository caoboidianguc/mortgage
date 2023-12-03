//
//  Model.swift
//  Mortgage
//
//  Created by Jubi on 11/19/23.
//

import Foundation

@MainActor
class ModelData: ObservableObject {
    var mortgage = Mortgage()
    @Published var bill: [Mortgage] = []
    
    
}
