//
//  NameAndColorCell.swift
//  TableCells
//
//  Created by Groom on 2019/5/17.
//  Copyright © 2019年 Groom. All rights reserved.
//

import UIKit

class NameAndColorCell: UITableViewCell {
    var name: String = ""{
        didSet{
            if(name != oldValue){
            nameLabel.text = name
            }
        }
    }
    var color: String = ""{
        didSet{
            if(color != oldValue){
                colorLabel.text = color
            }
        }
    }
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var colorLabel: UILabel!

        
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)!
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
