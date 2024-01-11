//
//  ContentView.swift
//  No Space Left On Device
//
//  Created by Patrik Cesnek on 05/06/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            Button("Run") {
                viewModel.downloadFile()
            }
            .buttonStyle(.bordered)
            .font(.largeTitle)
        }
        .padding()
        .onAppear{
            viewModel.downloadFile()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
