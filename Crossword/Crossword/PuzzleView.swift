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
    
    @IBInspectable
    public var scale : CGFloat = 0.9 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var puzzleBackground : CGRect {
        let boundSize = bounds.size
        return CGRect(x: 0.0, y: 0.0, width: boundSize.width * scale, height: boundSize.width * scale)
    }
    
    
    @IBAction func checkLength(_ sender: Any) {
        if (countElements(UITextField.text!) > 1) {
            textField.deleteBackward()
        }
    }
    
    
     
    
    
    
    private func puzzleBackgroundPath() -> UIBezierPath {
        let rectangle = UIBezierPath(rect: puzzleBackground)
        UIColor.black.setFill()
        rectangle.fill()
        return rectangle
    }
    
    override func draw(_ rect: CGRect) {
        UIColor.black.setStroke()
        puzzleBackgroundPath().stroke()
    }

}
