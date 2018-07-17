//
//  ViewController.swift
//  BullsEye
//
//  Created by Nour Abukhaled on 1/28/18.
//  Copyright © 2018 Nour Abukhaled. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
     var currentValue: Int = 0
    @IBOutlet weak var targetLabel: UILabel!
    var targetValue: Int = 0
    var score = 0
    @IBOutlet weak var scoreLabel: UILabel!
    var round = 1
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
       super.viewDidLoad()
       currentValue = lroundf(slider.value)
       startOver()
       let diff = abs(targetValue - currentValue)
       print(diff)
    }
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func startNewRound(){
        targetValue = Int(1 + arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    @IBAction func startOver(){
        startNewRound()
        score = 0
        round = 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderMoved(_ slider:UISlider){
        currentValue = lroundf(slider.value)
    }

    @IBAction func showHelloAlert() { // show in the alert
      let difference = abs(currentValue - targetValue)
      var points = 100 - difference
        
        round += 1
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        }
        else if difference < 5 {
            title = "You almost had it"
            if difference == 1 {
                points += 50
            }
        }
        else if difference < 10 {
            title = "Pretty good!"
        }
        else {
            title = "Not even close ..."
        }
     score += points
    let message = "You scored \(points) points"
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert) //body
    let action = UIAlertAction(title: "Awesome", style: .default, handler: { action in
        self.startNewRound()
        }) //button
    alert.addAction(action) // connect with each other
    present(alert, animated: true, completion: nil) // Present alert
   }
}


