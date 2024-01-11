//
//  ViewModel.swift
//  Tuning Trouble
//
//  Created by Patrik Cesnek on 16/04/2023.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var inputs = [String]()
        
    func part1(chars: [Character]) -> Int {
        findMarker(length: 4, chars: chars)
    }
    
    func part2(chars: [Character]) -> Int {
        findMarker(length: 14, chars: chars)
    }
    
    private func findMarker(length: Int, chars: [Character]) -> Int {
        for i in 0 ..< (chars.count - length) {
            let marker = chars[i ..< i + length]
            if Set(marker).count == length {
                return i + length
            }
        }
        return -1
    }
    
    func downloadFile() {
        let url = URL(filePath: "/Users/matee/Desktop/Advent of code/Tuning Trouble/Tuning Trouble/Input.txt")
        let items = try? String(contentsOf: url).components(separatedBy: .newlines)
        
        guard let items = items else { return }
        for item in items {
            print("Result: \(part1(chars: item.charactersArray))")
            print("Result2: \(part2(chars: item.charactersArray))")
        }
        inputs = items
    }
}

public extension String {
    /// SwifterSwift: Array of characters of a string.
    var charactersArray: [Character] {
        return Array(self)
    }
}
