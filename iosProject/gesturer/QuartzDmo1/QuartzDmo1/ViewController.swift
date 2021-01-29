//
//  ViewController.swift
//  QuartzDmo1
//
//  Created by Groom on 2019/5/15.
//  Copyright © 2019年 Groom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    private var oldFrame: CGRect!
    override func viewDidLoad() {
        super.viewDidLoad()
        oldFrame = imageView.frame
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        if imageView.frame.size.width < view.frame.size.width{
        imageView.frame = view.frame
        }else{
            imageView.frame = oldFrame
        }
    }
}

