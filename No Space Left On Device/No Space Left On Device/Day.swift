//
//  Day.swift
//  No Space Left On Device
//
//  Created by Patrik Cesnek on 05/06/2023.
//

import Foundation

protocol Day {
  func part1(_ input: String) throws -> CustomStringConvertible
  func part2(_ input: String) throws -> CustomStringConvertible
}
