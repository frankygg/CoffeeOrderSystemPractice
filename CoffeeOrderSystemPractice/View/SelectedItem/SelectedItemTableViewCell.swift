//
//  SelectedItemTableViewCell.swift
//  CoffeeOrderSystemPractice
//
//  Created by BoTingDing on 2018/6/18.
//  Copyright © 2018年 BoTingDing. All rights reserved.
//

import UIKit
import DLRadioButton
class SelectedItemTableViewCell: UITableViewCell {

    @IBOutlet weak var selectedItemImageView: UIImageView!
    
    @IBOutlet weak var itemLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
