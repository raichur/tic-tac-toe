//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Joshua Raichur on 3/24/15.
//  Copyright (c) 2015 Joshua Raichur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // For alternating x's and o's
    var goNumber = 1
    
    // 0 = empty, 1 = o, 2 = x
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var winner = 0
    
    // All of the eight winning combinations for tic tac toe
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    @IBOutlet weak var button0: UIButton!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var playAgain: UIButton!
    
    @IBAction func playAgainPressed(sender: AnyObject) {
        goNumber = 1
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        winner = 0
        
        for i in 0...8 {
            var button = view.viewWithTag(i) as UIButton
            button.setImage(nil, forState: .Normal)
        }
        
        label.alpha = 0
        playAgain.alpha = 0
        playAgain.enabled = false
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if (gameState[sender.tag] == 0 && winner == 0) {
            var image = UIImage()
            
            if (goNumber % 2 == 0) {
                image = UIImage(named: "x.png")!
                gameState[sender.tag] = 2
            } else {
                image = UIImage(named: "o.png")!
                gameState[sender.tag] = 1
            }
            
            for combination in winningCombinations {
                if(gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] && gameState[combination[0]] != 0) {
                    winner = gameState[combination[0]]
                }
            }
            
            if (winner != 0) {
                if (winner == 1) {
                    label.text = "O has won!"
                } else {
                    label.text = "X has won!"
                }
                UIView.animateWithDuration(0.5, animations: {
                    self.label.alpha = 1
                    self.playAgain.enabled = true
                    self.playAgain.alpha = 1
                })
            }
            
            goNumber++
            sender.setImage(image, forState: .Normal)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        label.alpha = 0
        playAgain.alpha = 0
    }


}

