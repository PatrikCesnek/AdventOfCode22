//
//  ViewModel.swift
//  Rock-papper-scissors
//
//  Created by Patrik Cesnek on 06/02/2023.
//

import Foundation

enum Move: Int {
    case rock = 1
    case paper = 2
    case scissor = 3

    init(character: Character) {
        switch character {
        case "A", "X": self = .rock
        case "B", "Y": self = .paper
        case "C", "Z": self = .scissor
        default: fatalError("This shoudl't be even posibble 🤷🏻‍♂️")
        }
    }
    
    func win() -> Move {
        // IF other guy selects scissors(3) select 1 to win ELSE select the one under to win
        guard let move = Move(rawValue: rawValue == 3 ? 1 : rawValue + 1) else { fatalError("Couldn't get Move") }
        return move
    }
    
    func loose() -> Move {
        // IF other guy selects rock(1) select 3 to loose ELSE select the one above to loose
        guard let move = Move(rawValue: rawValue == 1 ? 3 : rawValue - 1) else { fatalError("Couldn't get Move") }
        return move
    }
    
    func getResult(other: Move) -> Winner {
        if self == other { return .draw }
        if self == other.win() { return .youWin }
        else { return .youLoose }
    }
}

enum Winner: Int {
    case youWin = 6
    case draw = 3
    case youLoose = 0
    
    init(character: Character) {
        switch character {
        case "X": self = .youLoose
        case "Y": self = .draw
        case "Z": self = .youWin
        default: fatalError("This shoudl't be even posibble 🤷🏻‍♂️")
        }
    }
}

class ViewModel: ObservableObject {
    @Published var allMatches = [String]()
    @Published var totalScore = ""
    var score = 0

    func downloadFile() {
        let url = URL(filePath: "/Users/matee/Desktop/Advent of code/Rock-papper-scissors/Rock-papper-scissors/Input.txt")
        let matches = try? String(contentsOf: url).components(separatedBy: .newlines)
        guard let matches = matches else {
            print("No matches")
            return
        }
        for match in matches {
            // PART 1
//            score += getWinner(move: match)
//            allMatches.append("Your score is \(getWinner(move: match))")
            
            // PART 2
            score += getDesiredResult(move: match)
        }
        totalScore = "Your total score: \(score)"
    }
    
 // MARK: - PART 1
//    func getWinner(move: String) -> Int {
//        guard let othersScore = Move(rawValue: getOthersScore(move: move)) else { return 0 }
//        guard let yourScore = Move(rawValue: getYourScore(move: move)) else { return 0 }
//        return yourScore.getResult(other: othersScore).rawValue + yourScore.rawValue
//    }
//    
//    func getOthersScore(move: String) -> Int {
//        guard let firstCharacter = move.first else { return 0 }
//        return Move(character: firstCharacter).rawValue
//    }
//    
//    func getYourScore(move: String) -> Int {
//        guard let lastCharacter = move.last else { return 0 }
//        return Move(character: lastCharacter).rawValue
//    }
    
// MARK: - PART 2
    
    func getDesiredResult(move: String) -> Int {
        guard let yourMove = move.last else { return 0 }
        guard let othersMove = move.first else { return 0 }
        let score: Int = {
            switch Winner(character: yourMove) {
            case .youLoose: return Move(character: othersMove).loose().rawValue
            case .draw: return Move(character: othersMove).rawValue
            case .youWin: return Move(character: othersMove).win().rawValue
            }
        }()
        
        return score + Winner(character: yourMove).rawValue
    }
}
