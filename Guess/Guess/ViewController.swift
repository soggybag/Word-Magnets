//
//  ViewController.swift
//  Guess
//
//  Created by mitchell hudson on 4/28/15.
//  Copyright (c) 2015 mitchell hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var number: Int!
    var guessCount = 0
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var guessesLabel: UILabel!
    
    
    
    @IBAction func stepperChanged(sender: UIStepper) {
        
    }
    
    
    @IBAction func guessButtonTapped(sender: UIButton) {
        if let guess = inputText.text.toInt() {
            guessCount++
            guessesLabel.text = "\(guessCount)"
            if guess < number {
                messageLabel.text = "Too Low"
            } else if guess > number {
                messageLabel.text = "Too High"
            } else {
                messageLabel.text = "That's it!"
            }
        }
        
    }
    
    @IBAction func startButtonTapped(sender: UIButton) {
        number = Int(arc4random_uniform(100)) + 1
        inputText.text = "50"
        guessCount = 0
        messageLabel.text = "Guess a number between 1 - 100"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

