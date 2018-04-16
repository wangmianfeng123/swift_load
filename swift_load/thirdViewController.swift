//
//  thirdViewController.swift
//  swift_load
//
//  Created by 蜂尚网络 on 2018/4/13.
//  Copyright © 2018年 王绵峰. All rights reserved.
//

import UIKit

class thirdViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
      let dict:NSMutableDictionary = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib (nibName: "thirdTableViewCell", bundle: nil), forCellReuseIdentifier: "cellId")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.backgroundColor = UIColor.white
        for i in 0..<5 {
            let istr = String(i)
            dict.setValue(0, forKey: istr)
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 60))
        view.backgroundColor = UIColor.yellow
        let regiscoger = UITapGestureRecognizer(target: self, action: #selector(viewAction))
        view.addGestureRecognizer(regiscoger)
        view.tag = section
        let label = UILabel.init(frame: CGRect(x: 0, y: 0, width:self.view.frame.size.width, height: 60))
        label.textAlignment = .center
        label.text = "\(view.tag)"
        view.addSubview(label)
        return view
    }

    
    @objc func viewAction(gesture:UITapGestureRecognizer){
        let key:NSInteger = (gesture.view?.tag)!
        let keyStr:String = String(key)
        let value:NSInteger = dict.object(forKey: keyStr) as! NSInteger
        if value == 0 {
            print("关闭")
            dict.setValue(1, forKey: keyStr)
        }else{
            print("打开")
            dict.setValue(0, forKey: keyStr)
        }
        
        let indexSet:NSIndexSet = NSIndexSet.init(index: (gesture.view?.tag)!)
        tableView.reloadSections(indexSet as IndexSet, with: UITableViewRowAnimation.fade)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = [1,2,3,4,5]
        let ss=self.dict["\(section)"] as! Int
        if ss == 1 {
            return data.count
        }else{
            return 0
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = thirdTableViewCell()
        cell = (tableView.dequeueReusableCell(withIdentifier: "cellId") as! thirdTableViewCell)
        cell.textValue.text = "wang mian feng"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
