//
//  Array+Extensions.swift
//  Day3 Rucksack Reorganization
//
//  Created by Patrik Cesnek on 05/03/2023.
//

import Foundation

extension Array {
    func split() -> [[Element]] {
        let ct = self.count
        let half = ct / 2
        let leftSplit = self[0 ..< half]
        let rightSplit = self[half ..< ct]
        return [Array(leftSplit), Array(rightSplit)]
    }
}
