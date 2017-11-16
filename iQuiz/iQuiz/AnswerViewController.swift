//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Sarah Feldmann on 11/15/17.
//  Copyright © 2017 Sarah Feldmann. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    var questions: [Any]?
    var answer: Int?
    var questionIndex: Int?
    var score: Int?
    
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentQuestion = questions?[questionIndex!] as! [String:Any]
        let correctIndex = Int(currentQuestion["answer"] as! String)! - 1
        if answer == correctIndex {
            score! = score! + 1
            answerLabel.text = "Correct! \n"
        } else {
            answerLabel.text = "Incorrect \n"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func leftSwipe(_ sender: UISwipeGestureRecognizer) {
        if (questionIndex == questions!.count - 1) {
            performSegue(withIdentifier: "resultSegue", sender: self)
        } else {
            performSegue(withIdentifier: "questionSegue", sender: self)
        }
    }
    
    
    @IBAction func next(_ sender: UIBarButtonItem) {
        if (questionIndex == questions!.count - 1) {
            performSegue(withIdentifier: "resultSegue", sender: self)
        } else {
            performSegue(withIdentifier: "questionSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            let other = segue.destination as! ResultViewController
            other.score = score
            other.questions = questions
        } else if segue.identifier == "questionSegue" {
            let other = segue.destination as! QuestionViewController
            other.questions = questions
            other.score = score
            other.questionIndex = questionIndex! + 1
        }
    }
    
}
