//
//  UpdateViewController.swift
//  StudentManaSystem
//
//  Created by Groom on 2019/6/19.
//  Copyright © 2019年 Groom. All rights reserved.
//

import UIKit
import CoreData

class UpdateViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var nmLabel: UILabel!
    @IBOutlet var textFields:[UITextField]?
    var student: Student?
    override func viewDidLoad() {
        super.viewDidLoad()
        nmLabel.text = student?.name
        textFields?[0].text = student?.sno
        textFields?[1].text = student?.school
        textFields?[2].text = student?.creditCardNo
        textFields?[3].text = student?.location
        textFields?[4].text = student?.phoneNumber
        textFields?[5].text = student?.emailAddr
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func updateStudent(_ sender: Any) {
        
       
        let fetch:NSFetchRequest<Student> = Student.fetchRequest()
        fetch.predicate = NSPredicate(format: "name = %@", nmLabel.text!)
        let student = try? context.fetch(fetch)
        if let s = student?.first{
        s.sno = textFields?[0].text
        s.school = textFields?[1].text
        s.creditCardNo = textFields?[2].text
        s.location = textFields?[3].text
        s.phoneNumber = textFields?[4].text
        s.emailAddr = textFields?[5].text
        
        }
        dismiss(animated: true, completion: nil)
       

        
    }
    
}
