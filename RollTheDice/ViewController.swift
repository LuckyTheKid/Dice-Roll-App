//
//  ViewController.swift
//  RollTheDice
//
//  Created by Bojan Laketa on 11/1/17.
//  Copyright © 2017 Bojan Laketa. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var leftImage: UIImageView!
    
    @IBOutlet weak var rightImage: UIImageView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "rolldice", ofType: "mp3")
        let soundURL = URL(fileURLWithPath: path!)
        do {   try audioPlayer = AVAudioPlayer(contentsOf: soundURL)
            audioPlayer.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        label.isHidden = true
        
    }

    @IBAction func rollTheDice(_ sender: UIButton) {
        
        
        let firstNumber = arc4random_uniform(5) + 1
        
        let secondNumber = arc4random_uniform(5) + 1
        
        label.isHidden = false
        
        label.text = "Your total is \(firstNumber + secondNumber)"
        
        leftImage.image = UIImage(named: "Dice\(firstNumber)")
        
        rightImage.image = UIImage(named: "Dice\(secondNumber)")
        
        audioPlayer.currentTime = 0.05
        audioPlayer.play()
       
    }
    
    
}


