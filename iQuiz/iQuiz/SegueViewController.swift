//
//  SegueViewController.swift
//  iQuiz
//
//  Created by Sarah Feldmann on 11/14/17.
//  Copyright © 2017 Sarah Feldmann. All rights reserved.
//

import UIKit

class SegueViewController : UIViewController {

    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var option1: UILabel!
    @IBOutlet weak var option2: UILabel!
    @IBOutlet weak var option3: UILabel!
    @IBOutlet weak var option4: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
