//
//  AddViewController.swift
//  StudentManaSystem
//
//  Created by Groom on 2019/6/19.
//  Copyright © 2019年 Groom. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController {
    
    @IBOutlet var textFields:[UITextField]?
    var student: Student?
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func add(_ sender: Any) {
        let student = Student(context: context)
        student.name = textFields?[0].text
        student.sno = textFields?[1].text
        student.school = textFields?[2].text
        student.creditCardNo = textFields?[3].text
        student.location = textFields?[4].text
        student.phoneNumber = textFields?[5].text
        student.emailAddr = textFields?[6].text
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
