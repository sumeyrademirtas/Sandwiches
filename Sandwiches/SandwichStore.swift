//
//  SandwichStore.swift
//  Sandwiches
//
//  Created by Sümeyra Demirtaş on 12/11/24.
//

import Foundation

class SandwichStore: ObservableObject {
    @Published var sandwiches: [Sandwich]
    
    init(sandwiches: [Sandwich] = []) {
        self.sandwiches = sandwiches
    }
}

let testStore = SandwichStore(sandwiches: testData)
