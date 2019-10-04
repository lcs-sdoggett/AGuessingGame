//
//  ViewController.swift
//  AGuessingGame
//
//  Created by Doggett, Scott on 2019-09-30.
//  Copyright © 2019 Doggett, Scott. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    // MARK: Properties
    let targetNumber = Int.random(in: 1...100)
    @IBOutlet weak var submittedGuess: UITextField!
  
    // MARK: Inisializers
    
    
    // MARK: Methods (functions) - behaviours
    
    // Runs as soon as the view becomes visible to the user
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       speak(this: "I'm thinking of a number between 1 and 100. Guess what it is.")
        
    }
    
    // This will be used to check a guess
    @IBAction func checkGuess(_ sender: Any) {
        
        //Obtain the guess value from the text field
        let guessText = submittedGuess.text!
        let guessNumber = Int(guessText)!
        
        // For testing purposes, what was the guess?
        
        print("For printing purposes, the guess made was \(guessNumber)")
        
        // Give the appropriate feedback to the user
        
        if guessNumber > targetNumber {
            
           speak(this: "Guess lower next time")
            
        } else if guessNumber < targetNumber {
            
           speak(this: "Guess higher next time")
            
        } else {
            
            speak(this: "You are Correct")
        }
        
    }
    
    func speak(this message: String) {
        
        // Make an object named 'synthesizer', which is an instance of the class'
        //AVSpeechSynthesizer'
        let synthesizer = AVSpeechSynthesizer()
        
        // Make an object named 'utterance' which is an instance of the class
        //AVSpeechUtterance
        let utterance = AVSpeechUtterance(string: message)
        
        // Speak the message
        synthesizer.speak(utterance)
    }
}

