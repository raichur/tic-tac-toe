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
    
    @IBOutlet weak var button0: UIButton!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        var image = UIImage()
        
        if (goNumber % 2 == 0) {
            image = UIImage(named: "x.png")!
        } else {
            image = UIImage(named: "o.png")!
        }
        
        goNumber++
        sender.setImage(image, forState: .Normal)
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

