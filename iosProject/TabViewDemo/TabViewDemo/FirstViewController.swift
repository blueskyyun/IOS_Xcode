//
//  FirstViewController.swift
//  TabViewDemo
//
//  Created by Groom on 2019/6/15.
//  Copyright © 2019年 Groom. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let uuid = UUID().uuidString
        print(uuid)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

