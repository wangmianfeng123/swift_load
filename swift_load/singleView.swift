//
//  singleView.swift
//  swift_load
//
//  Created by 蜂尚网络 on 2018/3/20.
//  Copyright © 2018年 王绵峰. All rights reserved.
//

import UIKit

class singleView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = CGRect(x: 0, y: 64, width: 100, height: 200)
        self.backgroundColor = UIColor.lightGray
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    class func getRasdom() -> NSInteger {
        let radom = NSInteger(arc4random()%365)+1
        print("randomNum = ",radom,"?");
        return radom;
    }
    
    
    class func getResoult(test:String,num:String) ->String {
        return test+num
    }
    
}


//class func getRandomNum() -> NSInteger {




