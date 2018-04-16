//
//  ViewController.swift
//  swift_load
//
//  Created by 蜂尚网络 on 2018/3/20.
//  Copyright © 2018年 王绵峰. All rights reserved.
//

import UIKit
import SDWebImage
import Masonry
import Foundation

typealias Distance = Double

struct Position {//
    var x : Double
    var y : Double
}

struct Ship {
    var position:Position
    var firingRange:Distance
    var unsafeRange:Distance
}

extension Position {
    func inRange(range:Distance) -> Bool {
        return sqrt(x*x+y*y) <= range
    }
}

extension Ship {
    func canEdgeShip(target:Ship) -> Bool {
        let dx = target.position.x-position.x
        let dy = target.position.y-position.y
        let targetDistance = sqrt(dx*dx+dy*dy)
        return targetDistance <= target.firingRange
    }
}

class ViewController: UIViewController {
    
    typealias testClose = (Int,String) -> (Void)
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.view.backgroundColor = UIColor.red
        let label = UILabel()

        label.backgroundColor = UIColor.green
        label.text = "fengzi"
        self.view.addSubview(label)
        label.mas_makeConstraints { (make:MASConstraintMaker!) in
            make.right.mas_equalTo()(-15)
            make.left.mas_equalTo()(15)
            make.height.mas_equalTo()(30)
            make.top.mas_equalTo()(self.view.mas_top)?.offset()(100)
        }
      
        
        let clickBtn = UIButton()
        clickBtn.backgroundImage(for: .normal)
        clickBtn.backgroundColor = UIColor.white
        self.view.addSubview(clickBtn)
        clickBtn.addTarget(self, action: #selector(actionTwo), for: .touchUpInside)
        clickBtn.mas_makeConstraints { (make:MASConstraintMaker!) in
            make.left.mas_equalTo()(30)
            make.right.mas_equalTo()(-30)
            make.height.mas_equalTo()(30)
            make.bottom.mas_equalTo()(self.view.mas_bottom)?.offset()(-30)
        }
        
        let btn = UIButton(type:UIButtonType.system)
        btn.frame = CGRect(x: 0, y: 300, width: self.view.frame.size.width, height: 100);
        btn.backgroundColor = UIColor.yellow
        btn.addTarget(self, action: #selector(actionOne(_:)), for: .touchUpInside)
        self.view.addSubview(btn)
        
        let radom = singleView.getRasdom()
        let str = singleView.getResoult(test: "wang", num: "mian feng")
        print("^^^^:\(radom)*******:\(str)")
        print("isYes:\(Position.init(x: 10, y: 20))")
        
        print("isload:\(Position.init(x: 10, y: 20).inRange(range: 30))")
        print("isUnsafe:\(Ship.init(position: Position.init(x: 10, y: 20), firingRange: 100, unsafeRange: 200).canEdgeShip(target:))")
        
        print("isNum:\(sqrt(10*10+20*20))")
        
        let img = UIImageView()
        img.sd_setImage(with: nil, completed: nil)
    }
    
    
    
    @objc func actionTwo(btn:UIButton){
        let third = thirdViewController()
        self.navigationController?.pushViewController(third, animated: true)
    }
    
    
    @objc func actionOne(_ button:UIButton){
        let secondVC = SecondViewController()
        secondVC.firstCloseBlock = {(valueKey) -> () in
            print("**********:\(valueKey!)")
        }
        secondVC.closeBlock = {(cusValue) -> () in
            //cusValue就是传过来的值
            print("回调传过来的值:\(String(describing: cusValue))")
        }
        secondVC.secondBlockTwo = {(secondValue) -> () in
            print("++++:\(secondValue)")
        }
        
        secondVC.fengBlock = {
            (fengBlock,tt) -> () in
            print("dayin result\(fengBlock)\(tt)")
        }
        
        secondVC.shaBlock = {
            (shaStr) in
            print("sha hui diao Block:\(shaStr)")
        }
        
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

