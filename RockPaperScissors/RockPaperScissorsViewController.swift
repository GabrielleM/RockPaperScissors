//
//  RockPaperScissorsViewController.swift
//  RockPaperScissors
//
//  Created by Gabrielle Miller-Messner on 10/30/14.
//  Copyright (c) 2014 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class RockPaperScissorsViewController: UIViewController {

    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    var myMove:Character!
    var opponentMove:Character!
    var message: String!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Opportunity to emphasize DRY - Rock, Paper, and Scissors share code - What to do?
    @IBAction func rockButtonPressed(sender: AnyObject)
    {
        self.myMove = "R"
        self.didMakeMove()
    }
    
    @IBAction func paperButtonPressed(sender: AnyObject)
    {
        self.myMove = "P"
        self.didMakeMove()
    }
    
    @IBAction func scissorsButtonPressed(sender: AnyObject)
    {
        self.myMove = "S"
        self.didMakeMove()
    }
    
    func didMakeMove()
    {
        self.opponentMove = self.generatePlayFromOpponent()
        self.message = self.winner()
        let image = self.generateResultImage()
        
        // Get the storyboard and ResultViewController
        var storyboard = UIStoryboard (name: "Main", bundle: nil)
        var resultVC = storyboard.instantiateViewControllerWithIdentifier("ResultViewController") as ResultViewController
        
        resultVC.message = message
        resultVC.picture = image
        self.presentViewController(resultVC, animated: true, completion: nil)
    }
    
    func generatePlayFromOpponent()->Character
    {
        var move = Int(arc4random_uniform(3))
        switch move
        {
        case 0:
            return "R"
        case 1:
            return "P"
        case 2:
            return "S"
        default:
            return "D"
        }
    }
    
    func winner()-> String
    {
        if self.myMove == self.opponentMove
        {
            return "It's a tie!"
        }
            
        else
        {
            if self.myMove == "R" && self.opponentMove == "P"
            {
                return "Paper covers Rock. Sorry, you lose."
            }
                
            else if self.myMove == "R" && self.opponentMove == "S"
            {
                return "Rock crushes scissors. You win!"
            }
                
            else if self.myMove == "P" && self.opponentMove == "R"
            {
                return "Paper covers rock. You win!"
            }
                
            else if self.myMove == "P" && self.opponentMove == "S"
            {
                return "Scissors cut paper. Sorry, you lose."
            }
                
            else if self.myMove == "S" && self.opponentMove == "R"
            {
                return "Rock crushes scissors. Sorry, you lose."
            }
                
            else if self.myMove == "S" && self.opponentMove == "P"
            {
                return "Scissors cut paper. You win!"
            }
            
            return "Oops! What happened?"
        }
    }

    func generateResultImage()-> UIImage!
    {
        let firstChar = self.message[message.startIndex]
        if firstChar == "R"
        {
            let image = UIImage(named: "RockCrushesScissors")
            return image
        }
        
        else if firstChar == "P"
        {
            let image = UIImage(named: "PaperCoversRock")
            return image
        }

        else if firstChar == "S"
        {
            let image = UIImage(named: "ScissorsCutPaper")
            return image
        }
        
        else
        {
            let image = UIImage(named:"rock-paper-scissors1")
            return image
        }
    }
}