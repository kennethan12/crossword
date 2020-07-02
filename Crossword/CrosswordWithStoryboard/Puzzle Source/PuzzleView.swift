//
//  PuzzleView.swift
//  Crossword
//
//  Created by Jacob Justh and Kenneth An
//

import UIKit

class PuzzleView: UIView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    public struct Box : Equatable & Hashable {
           let id : Int
           let letter : String
           
           public func hash(into hasher: inout Hasher) {
               hasher.combine(id)
               hasher.combine(letter)
           }
           
           public func sameID(_ box: Box) -> Bool {
               return id == box.id
           }
           
           public static func ==(lhs: Box, rhs: Box) -> Bool {
               return lhs.id == rhs.id && lhs.letter == rhs.letter
           }
       }
    
    var userBoxes: [Box] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    
    
    @IBInspectable
    public var scale : CGFloat = 0.9 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    //    public var puzzleBackground : CGRect {
    //        let boundSize = bounds.size
    //        return CGRect(x: 0.0, y: 0.0, width: boundSize.width * scale, height: boundSize.width * scale)
    //    }
    //
    //    private func puzzleBackgroundPath() -> UIBezierPath {
    //        let rectangle = UIBezierPath(rect: puzzleBackground)
    //        UIColor.black.setFill()
    //        rectangle.fill()
    //        return rectangle
    //    }
    //
    //    override func draw(_ rect: CGRect) {
    //        UIColor.black.setStroke()
    //        puzzleBackgroundPath().stroke()
    //    }
    
}
