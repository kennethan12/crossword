//
//  PuzzleModel.swift
//  Crossword
//
//  Created by Jacob Justh and Kenneth An
//

import Foundation

public class Puzzle {
    
    public struct LetterCoord {
        let x : Int
        let y : Int
        let value : String
    }
    
    /**
     Immutable representation of an entry. Includes a hint, the answer, direction, and the position of the answer in the puzzle grid
     */
    public struct Entry {
        let hint : String
        let answer : String
        let letters : [LetterCoord]
    }
    
    private var horizontalBoxes : [Entry] = []
    private var verticalBoxes : [Entry] = []
    
}
