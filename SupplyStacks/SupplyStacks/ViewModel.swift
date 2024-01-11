//
//  ViewModel.swift
//  SupplyStacks
//
//  Created by Patrik Cesnek on 11/04/2023.
//

import Foundation

private struct Move {
    let count: Int
    let from: Int
    let to: Int

    init(_ str: String) {
        // move 1 from 1 to 2
        let parts = str.components(separatedBy: " ")
        count = Int(parts[1])!
        from = Int(parts[3])!
        to = Int(parts[5])!
    }
}

class ViewModel: ObservableObject {
    @Published var allMoves = [String]()
    private let crates: [Int: [Character]] = [:]
    private let moves: [Move] = []

    func downloadFile() {
        let url = URL(filePath: "/Users/matee/Desktop/Advent of code/SupplyStacks/SupplyStacks/Input.txt")
        let stacks = try? String(contentsOf: url).components(separatedBy: "/n/n")
        let moves = try? String(contentsOf: url).components(separatedBy: .newlines)
        allMoves = moves ?? [""]
    }
    
    func part1() {
        downloadFile()
        let input = allMoves.joined(separator: "\n")
        let parts = input.split(whereSeparator: \.isNewline)
        print(parts)
    }
    
    func createStacks() {
        let stacks = allMoves.joined(separator: "/n/n")
        print(stacks)
    }
    
    func createMoves(move: Int, from: Int, to: Int) {
        let stacks = allMoves.joined(separator: "\n\n")
        
        let moves = allMoves.joined(separator: "\n")
        for move in allMoves {
            
        }
    }
}

