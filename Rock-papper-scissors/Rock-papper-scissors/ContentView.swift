//
//  ContentView.swift
//  Rock-papper-scissors
//
//  Created by Patrik Cesnek on 06/02/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        VStack {
            Text("Result:")
                .font(.title)
            Text(viewModel.totalScore)
//            List {
//                ForEach(viewModel.allMatches, id: \.self) { match in
//                    Text(match)
//                }
//            }
            .onAppear {
                viewModel.downloadFile()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
