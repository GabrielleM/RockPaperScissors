//
//  ResultViewController.swift
//  RockPaperScissors
//
//  Created by Gabrielle Miller-Messner on 10/30/14.
//  Copyright (c) 2014 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    var message: NSString!
    var  picture: UIImage!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
   override func viewWillAppear(animated:Bool)
   {
       super.viewWillAppear(animated)
        self.messageLabel.text = self.message
        self.resultImageView.image = self.picture
   }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        UIView.animateWithDuration(1.5, animations:
            {
                self.resultImageView.alpha = 1;
            })
    }
    
    
    
    @IBAction func playAgainButtonPressed(sender: AnyObject)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
