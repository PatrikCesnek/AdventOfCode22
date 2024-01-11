//
//  ViewModel.swift
//  Day3 Rucksack Reorganization
//
//  Created by Patrik Cesnek on 05/03/2023.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var inputs = [String]()
    @Published var lines = [String]()
    @Published var score = 0
    
    func downloadFile() {
        let url = URL(filePath: "/Users/matee/Desktop/Advent of code/Rucksack-Recognition/Day3 Rucksack Reorganization/Day3 Rucksack Reorganization/inputs.txt")
        let items = try? String(contentsOf: url).components(separatedBy: .newlines)
        
        guard let items = items else { return }
        
        inputs = items
        separateCompartments()
        part2()
    }
    
    func separateCompartments() {
        for input in inputs {
            let count = input.count / 2
            let firstCompartment = input.prefix(count)
            let secondCompartment = input.suffix(count)
            let firtsArray = Array(firstCompartment)
            let secondArray = Array(secondCompartment)
            let same = firtsArray.filter { secondArray.contains($0)}
            let sameString = String(same)
            
            guard let firstChar = sameString.first else { return }
//            countScore(character: String(firstChar))
        }
    }
    
    func countScore(character: String) {
        let scores = Array(" abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        for char in character {
            score += scores.firstIndex(of: char) ?? 0
        }
        
        print(score)
    }
    
    func part2() {
        let groups = stride(from: 0, to: inputs.count, by: 3).map { Array(inputs[$0..<min($0+3, inputs.count)]) }
        for group in groups {
            let separatedStrings = (group[0], group[1], group[2])
            let firstElf = separatedStrings.0
            let secondElf = separatedStrings.1
            let thirdElf = separatedStrings.2
            let same = firstElf.filter { secondElf.contains($0) && thirdElf.contains($0) }
            guard let firstChar = same.first else { return }
            countScore(character: String(firstChar))
        }
    }
}
