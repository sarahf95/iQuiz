//
//  ResultsViewController.swift
//  iQuiz
//
//  Created by Sarah Feldmann on 11/16/17.
//  Copyright © 2017 Sarah Feldmann. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var questions: [Any]?
    var score: Int?
    var percent = 0.0
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var percentage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        percent = Double(score!) / Double(questions!.count)
        if percent == 1.0 {
            resultLabel.text = "Perfect!\n\(score!)/ \(questions!.count)"
        } else if percent >= 0.75 {
            resultLabel.text = "Pretty good!\n\(score!)/ \(questions!.count)"
        } else if percent >= 0.50 {
            resultLabel.text = "Not terrible...\n\(score!)/ \(questions!.count)"
        } else {
            resultLabel.text = "Try harder!\n\(score!)/ \(questions!.count)"
        }
        percentage.text = "\(Int(percent * 100))%"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

