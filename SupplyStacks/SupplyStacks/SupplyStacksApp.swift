//
//  SupplyStacksApp.swift
//  SupplyStacks
//
//  Created by Patrik Cesnek on 11/04/2023.
//

import SwiftUI

@main
struct SupplyStacksApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ViewModel())
        }
    }
}
