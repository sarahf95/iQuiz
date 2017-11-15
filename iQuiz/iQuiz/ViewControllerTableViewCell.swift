//
//  ViewControllerTableViewCell.swift
//  iQuiz
//
//  Created by Sarah Feldmann on 11/14/17.
//  Copyright © 2017 Sarah Feldmann. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var descript: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
