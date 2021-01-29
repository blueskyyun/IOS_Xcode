//
//  ViewController.swift
//  Control Fun
//
//  Created by groom y on 2019/3/7.
//  Copyright © 2019年 groom y. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    
    
    
    
    
    
    
    @IBAction func textFieldDoneEditing(sender: UITextField){
        sender.resignFirstResponder();
    }
}

