//
//  ViewModel.swift
//  Treetop Tree House
//
//  Created by Patrik Cesnek on 10/06/2023.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var inputs: [[Int]] = []
    
    func downloadFile() {
        let url = URL(filePath: "/Users/matee/Desktop/Advent of code/Treetop Tree House/Treetop Tree House/Input.txt")
        let items = try? String(contentsOf: url).components(separatedBy: .newlines)

        guard let items = items else { return }
        let updatedItems = removeLastElement(strings: items)

        let inputData = convertData(inputs: updatedItems)
        let result = countVisibleTrees(heights: inputData)
        print("Result: \(result)")
    }

    func convertData(inputs: [String]) -> [[Int]] {
        var result: [[Int]] = []

        for input in inputs {
            var intArray: [Int] = []

            for character in input {
                if let num = Int(String(character)) {
                    intArray.append(num)
                }
            }

            result.append(intArray)
        }

        return result
    }

    func removeLastElement(strings: [String]) -> [String] {
        var updatedArray = strings

        if !updatedArray.isEmpty {
            updatedArray.removeLast()
        }

        return updatedArray
    }

    func countVisibleTrees(heights: [[Int]]) -> Int {
        guard let columnCount = heights.first?.count else {
            return 0
        }

        let rowCount = heights.count
        var visibleCount = 0

        for row in 0..<rowCount {

            for column in 0..<columnCount {
                let currentHeight = heights[row][column]

                var isVisible = true

                for col in 0..<column {
                    if col < heights[row].count && heights[row][col] > currentHeight {
                        isVisible = false
                    }
                }

                if isVisible {
                    for col in (column + 1)..<columnCount {
                        if col < heights[row].count && heights[row][col] > currentHeight {
                            isVisible = false
                        }
                    }
                }

                if isVisible {
                    for r in 0..<row {
                        if heights[r].count > column && heights[r][column] > currentHeight {
                            isVisible = false
                        }
                    }
                }

                if isVisible {
                    for r in (row + 1)..<rowCount {
                        if heights[r].count > column && heights[r][column] > currentHeight {
                            isVisible = false
                        }
                    }
                }

                if isVisible {
                    visibleCount += 1
                }
            }
        }

        return visibleCount
    }
}
