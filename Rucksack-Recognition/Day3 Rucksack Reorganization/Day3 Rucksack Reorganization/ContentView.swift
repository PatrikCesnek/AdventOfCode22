//
//  ContentView.swift
//  Day3 Rucksack Reorganization
//
//  Created by Patrik Cesnek on 05/03/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        VStack {
            Text("Score is \(viewModel.score)")
                .font(.title)
        }
        .onAppear {
            viewModel.downloadFile()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
