//
//  PuzzleModel.swift
//  Crossword
//
//  Created by Jacob Justh and Kenneth An
//

import Foundation

public class Puzzle {
    
//    public struct LetterCoord : Equatable & Hashable {
//        let x : Int
//        let y : Int
//        let value : String
//
//        public func hash(into hasher: inout Hasher) {
//            hasher.combine(x)
//            hasher.combine(y)
//            hasher.combine(value)
//        }
//
//        public func sameCoord(_ coord: LetterCoord) -> Bool {
//            return x == coord.x && y == coord.y
//        }
//
//        public static func ==(lhs: LetterCoord, rhs: LetterCoord) -> Bool {
//            return lhs.x == rhs.x
//                && lhs.y == rhs.y
//                && lhs.value == rhs.value
//        }
//    }
    
    /**
     Immutable representation of an entry. Includes an id and a letter.
     */
    public struct Box : Equatable & Hashable {
        let id : Int
        let letter : String
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(id)
            hasher.combine(letter)
        }
        
        public static func ==(lhs: Box, rhs: Box) -> Bool {
            return lhs.id == rhs.id && lhs.letter == rhs.letter
        }
    }
    
    /**
     Immutable representation of an entry. Includes a hint, the answer, direction, and the position of the answer in the puzzle grid.
     */
    public struct Entry {
        let hint : String
        let answer : String
        let letters : [Box] //do we need this?
    }
    
    /// List of 'across' entries.
    private var across : [String : Entry]
    
    /// List of 'down' entries.
    private var down : [String : Entry]
    
    /**
     A map that links each box to either its associated horizontal word or vertical word. The value is also a dictionary that has the direction as its key and the entry number as its value.
     
     For example: `Box: ["across" : "1", "down" : "5"]`
     */
    private var map : [Box : [String : String]]
    
    /// Initializing empty puzzle
    public init() {
        self.across = [:]
        self.down = [:]
        self.map = [:]
    }
    
    /// Initializing by reading in a JSON file.
    public convenience init(jsonForGraphWithProperties json : [String:Any]) {
        self.init()
        
        if let entries = json["entries"] as? [Any] {
            for entry in entries {
                
                let tempEntry = entry as! [String: Any]
                
                let boxes = tempEntry["boxes"] as? [Any]
                var listBox : [Box] = []
                
                let direction = tempEntry["direction"] as! String
                let number = tempEntry["number"] as! String
                
                for box in boxes! {
                    let tempBox = box as! [String: Any]
                    let id = tempBox["id"] as! Int
                    let letter = tempBox["letter"] as! String
                    let newBox = Box(id: id, letter: letter)
                    listBox.append(newBox)
                    
                    if !self.map.keys.contains(newBox) {
                        self.map[newBox] = [:]
                    }
                    self.map[newBox]?[direction] = number
                }
                
                let hint = tempEntry["hint"] as! String
                let answer = tempEntry["term"] as! String
                
                let newEntry = Entry(hint: hint, answer: answer, letters: listBox)
                
                if direction == "across" {
                    self.across[number] = newEntry
                } else {
                    self.down[number] = newEntry
                }
            }
        }
    }
    
    /**
     Function that lists all the 'across' entries.
     */
    public func listAcross() -> [String] {
        var listAcross : [String] = []
        for entry in self.across.keys {
            listAcross.append(entry)
        }
        return listAcross
    }
    
    /**
     Function that lists all the 'down' entries.
     */
    public func listDown() -> [String] {
        var listDown : [String] = []
        for entry in self.down.keys {
            listDown.append(entry)
        }
        return listDown
    }
    
    /**
     Provide the appropriate hint based on which box and direction is selected.
     
     **Requires**: `Box` input and a `String` direction -- either "across" or "down"
     
     - Parameter input: `Box` which its id will be read
     - Parameter direction: the direction of the word (across or down)
     */
    public func provideHint(input: Box, direction: String) -> String {
        if let box = self.map.keys.first(where: { $0.id == input.id } ) {
            if let value = self.map[box] {
                if let entryNumber = value[direction] {
                    if direction == "across" {
                        return self.across[entryNumber]?.hint ?? ""
                    } else {
                        return self.down[entryNumber]?.hint ?? ""
                    }
                }
            }
        }
        return ""
    }
    
    /**
     Checks if the text input of a box is correct.
     
     **Requires**: `Box` that includes the letter the user has inputted.
     
     - Parameter input: `Box`
     */
    public func checkBox(input: Box) -> Bool {
        return self.map.keys.contains(where: { $0 == input })
    }
    
}
