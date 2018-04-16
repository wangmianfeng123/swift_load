//
//  thirdTableViewCell.swift
//  swift_load
//
//  Created by 蜂尚网络 on 2018/4/13.
//  Copyright © 2018年 王绵峰. All rights reserved.
//

import UIKit

class thirdTableViewCell: UITableViewCell {

    @IBOutlet weak var textValue: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = UITableViewCellSelectionStyle.none
    }
    
}
