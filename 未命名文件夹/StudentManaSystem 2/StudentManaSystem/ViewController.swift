//
//  ViewController.swift
//  StudentManaSystem
//
//  Created by Groom on 2019/6/17.
//  Copyright © 2019年 Groom. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    static var usnm:String!
    static var passwd: String!

    @IBOutlet weak var userNm: UITextField!
    @IBOutlet weak var pswd: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        let student = Student(context: context)
//        student.name = "tom"
//       
//        student.sno = "ddd"
//        student.phoneNumber = "110"
//        student.emailAddr = "z13"
//        student.location = "HB"
//        student.creditCardNo = "1234"
//        student.school = "CS"
//        appDelegate.saveContext()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(_ sender: Any) {
        let fetch:NSFetchRequest<User> = User.fetchRequest()
       
        let predicate1 = NSPredicate(format: "userName = %@", userNm.text!)
        let predicate2 = NSPredicate(format: "password = %@", pswd.text!)
        let andPredicate = NSCompoundPredicate(type: .and, subpredicates: [predicate1, predicate2])
        fetch.predicate = andPredicate
        
        let users = try? context.fetch(fetch)
        if let u = users?.first{
            ViewController.usnm = u.userName
            ViewController.passwd = u.password
            self.performSegue(withIdentifier: "main", sender: self)
        }
        
        
    }

    @IBAction func signup(_ sender: Any) {
        let ur = User(context: context)
        if let str1 = userNm.text, let str2 = pswd.text{
        ur.userName = userNm.text!
        ur.password = pswd.text!
        appDelegate.saveContext()
        
        }
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "main"{
//            let secVC = segue.destination as! UITabBarController
//            dismiss(animated: true, completion: nil)
//            }
//            
//        }
    }


