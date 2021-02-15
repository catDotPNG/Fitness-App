//
//  DayTableViewCell.swift
//  FitnessApp
//
//  Created by corey on 2/13/21.
//

import UIKit

class DayTableViewCell: UITableViewCell {

    @IBOutlet weak var cellViewBG: UIView!
    @IBOutlet weak var dayImageView: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellViewBG.layer.cornerRadius = cellViewBG.frame.size.height / 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
