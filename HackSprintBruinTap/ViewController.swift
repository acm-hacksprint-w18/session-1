//
//  ViewController.swift
//  HOTHBruinTap
//
//  Created by Kevin Tan on 11/12/17.
//  Copyright © 2017 Kevin Tan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Properties
    
    var score = 0
    
    var timer: Timer!
    var time: Double = 10
    
    var gameOverView: UIView!
    
    @IBOutlet var startButton: UIButton!
    @IBOutlet var tapButton: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    // Methods
    
    @objc func timerAction() {
        
        time -= 0.01
        timeLabel.text = String(format: "%.2f", time)
        
        if time <= 0 {
            
            timer.invalidate()
            timeLabel.text = "0.00"
            
            startButton.isEnabled = true
            tapButton.isEnabled = false

        }
        
    }
    
    @IBAction func tapButtonTapped(_ sender: UIButton) {
        
        score += 1
        scoreLabel.text = String(score)
        
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        score = 0
        scoreLabel.text = "0"
        
        time = 10
        timeLabel.text = String(format: "%.2f", time)
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
        startButton.isEnabled = false
        tapButton.isEnabled = true
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tapButton.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

