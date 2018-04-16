//
//  SecondViewController.swift
//  swift_load
//
//  Created by 蜂尚网络 on 2018/3/20.
//  Copyright © 2018年 王绵峰. All rights reserved.
//



import UIKit

class SecondViewController: UIViewController {
    typealias typeBlock = (_ str:String?) ->()
    typealias firstBlock = (_ strBlock:String?) ->()
    typealias secondBlock = (_ secondStr:String) -> (Void)
    typealias fengziBlock = (Int,String) -> (Void)
    typealias shabiBlock = (String) -> (Void)
    let nameBlock : (Int,Int) -> (Int) = {
        (a,b) in
        return a+b
    }
    

    
    //定义闭包变量类型
    var closeBlock : typeBlock?
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            closeBlock!("zheshgidfsd")
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    var firstCloseBlock : firstBlock?
    var secondBlockTwo : secondBlock?
    
    var fengBlock : fengziBlock?
    var shaBlock : shabiBlock?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        firstCloseBlock!("dddddddddddd")
        secondBlockTwo!("wangmianfeng")
        fengBlock!(2,"33333")
        print("position value is equal:\(Position.init(x: 10, y: 40).inRange(range: 40))")
        
        let result = nameBlock(10, 10)
        print("result is \(result)")
        
        let btn = UIButton()
        btn.frame = CGRect(x: 50, y: 100, width: self.view.frame.size.width-100, height: 100)
        btn.backgroundColor  = UIColor.yellow
        btn.addTarget(self, action:#selector(actionOne), for: .touchUpInside)
        self.view.addSubview(btn)
    
    }

    @objc func actionOne (){
        shaBlock!("feng zi is shai ge")
        self.navigationController?.popToRootViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
