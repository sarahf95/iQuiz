//
//  ViewController.swift
//  iQuiz
//
//  Created by Sarah Feldmann on 11/5/17.
//  Copyright © 2017 Sarah Feldmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var selectedQuestions:[Any]?
    
    let questions =
        ["Math":
            ["description":"Fun with numbers!",
             "icon": "math",
             "questions":
                [
                    [
                        "text": "What is 1 + 0?",
                        "answer": "2",
                        "options": [
                            "0",
                            "1",
                            "-1",
                            "2"
                        ]
                    ],
                    [
                        "text": "What is 3 * 3",
                        "answer": "1",
                        "options": [
                            "9",
                            "27",
                            "6",
                            "0"
                        ]
                    ],
                    [
                        "text": "What is the square root of 69",
                        "answer": "4",
                        "options": [
                            "3",
                            "1",
                            "6",
                            "9"
                        ]
                    ]
                ],
            ],
         "Marvel Super Heroes":
            ["description":"They'll save the day!",
             "icon": "superhero",
             "questions":
                [
                    [
                        "text": "What is Captain America's name?",
                        "answer": "3",
                        "options": [
                            "The Hulk",
                            "Bucky Barnes",
                            "Steve Rodgers",
                            "Hawkeye"
                        ]
                    ],
                ],
            ],
         "Science":
            ["description":"Chemicals and stuff!",
             "icon": "science",
             "questions":
                [
                    [
                        "text": "What is the chemical symbol for lead?",
                        "answer": "3",
                        "options": [
                            "C",
                            "Au",
                            "Pb",
                            "Li"
                        ]
                    ],
                ],
            ]
    ]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        let keys = Array(questions.keys)[indexPath.row]
        let subjects = questions[keys]! as [String:Any]
        cell.myTitle.text = keys
        cell.descript.text = subjects["description"] as! String
        cell.pic.image = UIImage(named: subjects["icon"] as! String)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ViewControllerTableViewCell
        let key = cell.myTitle.text!
        let dictionary = questions[key]! as [String:Any]
        selectedQuestions = dictionary["questions"] as! [Any]
        performSegue(withIdentifier: "questionSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let other = segue.destination as! QuestionViewController
        other.questions = selectedQuestions
        other.questionIndex = 0
        other.score = 0
    }
    
    @IBAction func clickSettings(_ sender: Any) {
        // create the alert
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: UIAlertControllerStyle.alert)
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

