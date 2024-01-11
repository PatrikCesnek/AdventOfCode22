//
//  ContentView.swift
//  Day4
//
//  Created by Patrik Cesnek on 22/03/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        List {
            ForEach(viewModel.inputs, id: \.self) { input in
                Text(input)
            }
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
