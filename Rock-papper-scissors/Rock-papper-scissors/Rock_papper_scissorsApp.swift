//
//  Rock_papper_scissorsApp.swift
//  Rock-papper-scissors
//
//  Created by Patrik Cesnek on 06/02/2023.
//

import SwiftUI

@main
struct Rock_papper_scissorsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ViewModel())
        }
    }
}
