//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 5]
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = "How do you like your eggs?"
        
        let hardness: String = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        if secondsPassed < totalTime {
            secondsPassed = secondsPassed + 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        }
        else {
            titleLabel.text = "DONE!"
            timer.invalidate()
        }
    }
}



