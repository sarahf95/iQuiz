//
//  ViewController.swift
//  iQuiz
//
//  Created by Sarah Feldmann on 11/5/17.
//  Copyright © 2017 Sarah Feldmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Table
    let categories = ["Math", "Hero", "Science"]
    let images = ["math", "superhero", "science"]
    let descrip = ["Fun with numbers", "They'll save the day!", "Chemicals and stuff!"]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
//    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier : "cell")
//        cell.imageView?.image = UIImage(named: (images[indexPath.row] + ".png"))
//        cell.textLabel?.text = categories[indexPath.row]
////        cell.detailTextLabel?.text = descrip[indexPath.row]
//        return (cell)
//    }
//
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        cell.myTitle.text = categories[indexPath.row]
        cell.descript.text = descrip[indexPath.row]
        cell.pic.image = UIImage(named: (images[indexPath.row]) as! String)
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func clickSettings(_ sender: Any) {
        
        
        // create the alert
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    var myIndex = 0
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
//    {
//        myIndex = indexPath.row
//        performSegue(withIdentifier: "segue", sender: self)
//    }
}

