//
//  PuzzleViewController.swift
//  Crossword
//
//  Created by Jacob Justh and Kenneth An
//

import UIKit

class PuzzleViewController: UIViewController {

   

    struct LetterCoord {
        let x : Int
        let y : Int
        let value : String
    }
    
    @IBOutlet weak var puzzleView: PuzzleView! {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI(){
        // maybe check if puzzle is complete?
        
        
    }
    
    override func viewDidLoad() {
           super.viewDidLoad()

           // Do any additional setup after loading the view.
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
