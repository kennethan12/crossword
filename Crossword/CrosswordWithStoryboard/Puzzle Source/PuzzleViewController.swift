//
//  PuzzleViewController.swift
//  Crossword
//
//  Created by Jacob Justh and Kenneth An
//

import UIKit

class PuzzleViewController: UIViewController, UITextFieldDelegate {
    
    enum Direction : String {
        case across = "across"
        case down = "down"
    }
    
    private var currentDirection = Direction.across
    private var previousBoxID : Int = 0
    
    @IBOutlet weak var puzzleView: PuzzleView!
    
    private var model = Puzzle()
    
    
    @IBOutlet weak var hintLabel: UILabel!
    
    @IBOutlet weak var box0: UITextField!
    @IBOutlet weak var box1: UITextField!
    @IBOutlet weak var box2: UITextField!
    @IBOutlet weak var box3: UITextField!
    @IBOutlet weak var box4: UITextField!
    
    @IBOutlet weak var box5: UITextField!
    @IBOutlet weak var box6: UITextField!
    @IBOutlet weak var box7: UITextField!
    @IBOutlet weak var box8: UITextField!
    @IBOutlet weak var box9: UITextField!
    
    @IBOutlet weak var box10: UITextField!
    @IBOutlet weak var box11: UITextField!
    @IBOutlet weak var box12: UITextField!
    @IBOutlet weak var box13: UITextField!
    @IBOutlet weak var box14: UITextField!
    
    @IBOutlet weak var box15: UITextField!
    @IBOutlet weak var box16: UITextField!
    @IBOutlet weak var box17: UITextField!
    @IBOutlet weak var box18: UITextField!
    @IBOutlet weak var box19: UITextField!
    
    @IBOutlet weak var box20: UITextField!
    @IBOutlet weak var box21: UITextField!
    @IBOutlet weak var box22: UITextField!
    @IBOutlet weak var box23: UITextField!
    @IBOutlet weak var box24: UITextField!
    
    
    private func updateUI(){
        // maybe check if puzzle is complete?
    }
    
    // this method should display the hint when the box is tapped 
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let boxIDString = textField.restorationIdentifier {
            let boxId = Int(boxIDString) ?? -1
            
            // set the direction for the hint based on the current direction
            // and if the box was tapped twice
            if (previousBoxID == boxId){
                if (currentDirection == Direction.across) {
                    currentDirection = Direction.down
                } else {
                    currentDirection = Direction.across
                }
            }
            // get hint with box number and current direction
            let boxToCheck = Puzzle.Box(id: boxId, letter: "")
            
            let hintToReturn = model.provideHint(input: boxToCheck, direction: currentDirection.rawValue)
            hintLabel.text = hintToReturn
        }
        
    }
    
    
    func textField(_ textFieldToChange: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString newChar: String) -> Bool {
        
        // ensures that textFields for boxes can only contain 1 character
        let startCharacterCount = textFieldToChange.text?.count ?? 0
        let charsToAddCount = newChar.count
        let lenToRplace = range.length
        let newLen = startCharacterCount + charsToAddCount - lenToRplace
        
        //method to compare textFieldToChange to referenced outlets above
        //get the info of which box in the form of an id?
        let boxIndex = textFieldToChange.restorationIdentifier
        // need to do something with this information
        
        
        previousBoxID = Int(boxIndex!) ?? -1
        return newLen <= 1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        
        let text = DataFiles.loadFile(named: "mini-1.json")
        let json = try! JSONSerialization.jsonObject(with: text.data(using: .utf8)!) as! [String:Any]
        model = Puzzle(jsonForGraphWithProperties: json)
        
        
        
        
        //self.PuzzleView --> init stuff
        // need to set up the boxes in PuzzleView
        
        
        //self.model -- init stuff
        
        // get info from model on how to display view
        // figure out which boxes needed to start blacked out
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
