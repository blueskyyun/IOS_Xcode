//
//  tableCellTableViewCell.swift
//  webServer
//
//  Created by Groom on 2019/4/28.
//  Copyright © 2019年 Groom. All rights reserved.
//

import UIKit

class tableCellTableViewCell: UITableViewCell {

    @IBOutlet weak var NewsImage: UIImageView!
    @IBOutlet weak var NewsTitle: UILabel!
    @IBOutlet weak var NewsDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
