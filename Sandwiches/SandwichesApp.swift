//
//  SandwichesApp.swift
//  Sandwiches
//
//  Created by Sümeyra Demirtaş on 12/11/24.
//

import SwiftUI

@main
struct SandwichesApp: App {
    @StateObject private var store = SandwichStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
