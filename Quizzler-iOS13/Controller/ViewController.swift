//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var firstAnswer: UIButton!
    @IBOutlet var secondAnswer: UIButton!
    @IBOutlet var thirdAnswer: UIButton!
    @IBOutlet var progressBarLabel: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        if quizBrain.checkAnswer(userAnswer) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (Timer) in
            self.updateUI()
        }
    }

    
    func updateUI() {
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        progressBarLabel.progress = quizBrain.getProgress()
        firstAnswer.setTitle(quizBrain.getAnswers(n: 0), for: .normal)
        secondAnswer.setTitle(quizBrain.getAnswers(n: 1), for: .normal)
        thirdAnswer.setTitle(quizBrain.getAnswers(n: 2), for: .normal)
        firstAnswer.backgroundColor = .clear
        secondAnswer.backgroundColor = .clear
        thirdAnswer.backgroundColor = .clear
        questionLabel.text = quizBrain.getQuestionText()
    }

}

