//
//  ContentView.swift
//  Treetop Tree House
//
//  Created by Patrik Cesnek on 10/06/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        VStack {
            Text("INPUTS:")
            
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
