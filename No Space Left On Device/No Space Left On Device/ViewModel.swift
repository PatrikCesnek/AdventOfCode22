//
//  ViewModel.swift
//  No Space Left On Device
//
//  Created by Patrik Cesnek on 05/06/2023.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var inputs = [String]()
    
    func downloadFile() {
        let url = URL(filePath: "/Users/matee/Desktop/Advent of code/No Space Left On Device/No Space Left On Device/Inputs.txt")
        let commands = try? String(contentsOf: url)
        
        guard let commands = commands else { return }
        let day = Day7()
        do {
//            print(try day.part1(commands))
            print(try day.part2(commands))
        } catch {
            print(error)
        }
    }
}

class Day7: Day {
    
    class Node {
        let name: String
        weak var parent: Node?
        var children: [Node]
        var size: Int?
        
        init(name: String, parent: Node? = nil, children: [Node] = [], size: Int? = nil) {
            self.name = name
            self.parent = parent
            self.children = children
            self.size = size
        }
        
        func addChild(_ child: Node) {
            child.parent = self
            self.children.append(child)
        }
        
        lazy var nodeSize: Int = {
            size ?? 0 + children.map(\.nodeSize).sum
        }()
        
        func subdirsUnderSize(_ maxSize: Int) -> [Node] {
            guard self.size == nil else { return [] }
            if nodeSize <= maxSize {
                return [self] + children.flatMap { $0.subdirsUnderSize(maxSize)}
            } else {
                return children.flatMap { $0.subdirsUnderSize(maxSize) }
            }
        }
        
        var directories: [Node] {
            let directories = children.filter { $0.size == nil }
            return directories + directories.flatMap(\.directories)
        }
    }
    
    func part1(_ input: String) throws -> CustomStringConvertible {
        let root = try parseTree(input: input)
        return root.subdirsUnderSize(100000).map(\.nodeSize).sum
    }
    
    func part2(_ input: String) throws -> CustomStringConvertible {
        let root = try parseTree(input: input)
        let currentSize = root.nodeSize
        let unusedSpace = 70000000 - currentSize
        let requiredDeletion = 30000000 - unusedSpace
        let directories = root.directories.sorted(by: { $0.nodeSize < $1.nodeSize })
        return directories.first(where: { $0.nodeSize > requiredDeletion})!.nodeSize
    }
    
    func parseTree(input: String) throws -> Node {
        let root = Node(name: "/")
        var current: Node? = root
        let input = input.lines().dropFirst()
        for line in input {
            if line.hasPrefix("$") {
                let parts = line.split(separator: " ")
                switch parts[1] {
                case "cd":
                    switch parts[2] {
                    case "/":
                        current = root
                    case "..":
                        current = current?.parent
                    default:
                        guard let nextNode = current?.children.first(where: { $0.name == parts[2] }) else { throw fatalError() }
                        current = nextNode
                    }
                default:
                    continue
                }
            } else {
                let parts = line.split(separator: " ")
                if let size = Int(parts[0]) {
                    let newNode = Node(name: String(parts[1]), size: size)
                    current?.addChild(newNode)
                } else if parts[0] == "dir" {
                    let newNode = Node(name: String(parts[1]))
                    current?.addChild(newNode)
                }
            }
        }
        return root
    }
}

extension Sequence where Element: Numeric {
  var sum: Element {
    return reduce(0, +)
  }

  var product: Element {
    return reduce(1, *)
  }
}

extension Sequence {
  func count(where: (Element) -> Bool) -> Int {
    return filter(`where`).count
  }
}

extension String {
  func lines(includeEmpties: Bool = false) -> [Substring] {
    self.split(separator: "\n", omittingEmptySubsequences: !includeEmpties)
  }
}
