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
                        "text": "What's 2+2?",
                        "answer": "1",
                        "options": [
                            "4",
                            "22",
                            "An irrational number",
                            "No one knows"
                        ]
                    ],
                ],
            ],
         "Marvel Super Heroes":
            ["description":"Avengers, Assemble!",
             "icon": "superhero",
             "questions":
                [
                    [
                    "text":"Who is Iron Man?",
                    "answer":"1",
                    "options":[
                    "Tony Stark",
                    "Obadiah Stane",
                    "A rock hit by Megadeth",
                    "Nobody knows"
                    ]
                ],
             [
                "text":"Who founded the X-Men?",
                "answer":"2",
                "options":[
                "Tony Stark",
                "Professor X",
                "The X-Institute",
                "Erik Lensherr"
                ]
            ],
            [
                "text":"How did Spider-Man get his powers?",
                "answer":"1",
                "options":[
                "He was bitten by a radioactive spider",
                "He ate a radioactive spider",
                "He is a radioactive spider",
                "He looked at a radioactive spider"
                ]
            ]
        ]
        ],
         "Science":
            ["description":"Because SCIENCE!",
             "icon": "science",
             "questions":
                [
                    [
                        "text": "What is fire?",
                        "answer": "3",
                        "options": [
                            "One of the four classical elements",
                            "A magical reaction given to us by God",
                            "A band that hasn't yet been discovered",
                            "Fire! Fire! Fire! heh-heh"
                        ]
                    ],
                ],
            ]
    ]
    
    var descrip = [String: String]()
    var categories = [String]()
    var icons = ["science", "superhero", "math"]
    var quests = [String: [[String:Any]]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://tednewardsandbox.site44.com/questions.json")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil
            {
                print("Error")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        for category in (myJson as? NSArray)!
                        {
                            if let cat = category as? NSDictionary
                            {
                                let t = cat["title"]
                                let d = cat["desc"]
                                self.categories.append(t! as! String)
                                self.descrip[t! as! String] = d! as? String

                                let q = cat["questions"]!
//                                print("q \(q)")
                                self.quests[t! as! String] = q as? [[String : Any]]
                                //                                print(q)

                            }
                        }
                    }
                    catch
                    {
                        
                    }
                }
            }
            
        }
        task.resume()
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        if(isViewLoaded){
            print(indexPath.row)
            let keys = categories[indexPath.row]
            cell.myTitle.text = keys
            cell.descript.text = descrip[keys]
            cell.pic.image = UIImage(named: icons[indexPath.row] as! String)
        }
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(isViewLoaded){
            let cell = tableView.cellForRow(at: indexPath) as! ViewControllerTableViewCell
            let key = cell.myTitle.text!
//            let dictionary = quests[key]!
//            selectedQuestions = dictionary["questions"] as! [Any]
            selectedQuestions = quests[key]!
            performSegue(withIdentifier: "questionSegue", sender: self)
        }
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
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

