//
//  CustomCell.swift
//  MockingBird
//
//  Created by Kim Page on 3/6/19.
//  Copyright © 2019 Kim Page. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var newsFeedImageView: UIImageView!
    
    @IBOutlet weak var wordLabel: UILabel!
    
    @IBOutlet weak var newsFeedTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        newsFeedImageView.layer.cornerRadius = 5

    }

    
    
    
    
}
