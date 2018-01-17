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
    
    var highScore = 0
    let highScoreKey = "HighScore"
    
    @IBOutlet var startButton: UIButton!
    @IBOutlet var tapButton: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var highScoreLabel: UILabel!
    
    // Methods
    
    @objc func timerAction() {
        
        // Decrease time by 0.01s
        time -= 0.01
        timeLabel.text = String(format: "%.2f", time)
        
        // If time <= 0, stop the timer.
        if time <= 0 {
            
            // Invalidate timer and reset timeLabel's text to 0.00.
            timer.invalidate()
            timeLabel.text = "0.00"
            
            // Reenable buttons.
            startButton.isEnabled = true
            tapButton.isEnabled = false
            
            // If score > highScore, we have a new high score!
            if score > highScore {
                
                highScore = score
                highScoreLabel.text = "High Score: " + String(highScore)
                UserDefaults.standard.set(highScore, forKey: highScoreKey)
                
            }

        }
        
    }
    
    @IBAction func tapButtonTapped(_ sender: UIButton) {
        
        // When we tap the tap button, increment score by 1 and update scoreLabel.
        score += 1
        scoreLabel.text = String(score)
        
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        // Reset score and scoreLabel text.
        score = 0
        scoreLabel.text = "0"
        
        // Set time to 10s and set timeLabel's text accordingly.
        time = 10
        timeLabel.text = String(format: "%.2f", time)
        
        // Start the timer.
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
        // Disable the start button and enable the tap button.
        startButton.isEnabled = false
        tapButton.isEnabled = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Disable tap button initially.
        tapButton.isEnabled = false
        
        // Get user's high score from memory.
        highScore = UserDefaults.standard.integer(forKey: highScoreKey)
        highScoreLabel.text = "High Score: " + String(highScore)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

