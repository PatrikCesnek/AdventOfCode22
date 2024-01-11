//
//  ViewModel.swift
//  Day4
//
//  Created by Patrik Cesnek on 22/03/2023.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var inputs = [String]()
    @Published var contaiedItems = 0

    func downloadFile() {
        let url = URL(filePath: "/Users/matee/Desktop/Advent of code/Day4/Day4/input.txt")
        let items = try? String(contentsOf: url).components(separatedBy: .newlines)
        
        guard let items = items else { return }
        
        inputs = items
        separateElfs()
    }
    
    func separateElfs() {
        for item in inputs {
            let firstElf = item.components(separatedBy: ",").first
            guard let firstNum = Int(firstElf?.components(separatedBy: "-").first ?? "0") else { return }
            guard let secondNum = Int(firstElf?.components(separatedBy: "-").last ?? "0") else { return }
            
            let firstRange = Range(firstNum...secondNum)
            
            let secondElf = item.components(separatedBy: ",").last
            guard let firstNumSecondElf = Int(secondElf?.components(separatedBy: "-").first ?? "0") else { return }
            guard let secondNumSecondElf = Int(secondElf?.components(separatedBy: "-").last ?? "0") else { return }
            
            let secondRange = Range(firstNumSecondElf...secondNumSecondElf)
            
            // PART 1
//            if firstRange.contains(secondRange) {
//                contaiedItems += 1
//            } else if secondRange.contains(firstRange) {
//                contaiedItems += 1
//            }
            
            // PART 2
            
            if firstRange.overlaps(secondRange) {
                contaiedItems += 1
            }
            
            print(contaiedItems)
        }
    }
}
