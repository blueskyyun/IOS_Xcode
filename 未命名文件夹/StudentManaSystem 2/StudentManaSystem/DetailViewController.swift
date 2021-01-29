//
//  DetailViewController.swift
//  StudentManaSystem
//
//  Created by Groom on 2019/6/17.
//  Copyright © 2019年 Groom. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    @IBOutlet var valueLabels:[UILabel]!
    var student: Student?
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        valueLabels[0].text = student?.name
        valueLabels[1].text = student?.sno
        valueLabels[2].text = student?.school
        valueLabels[3].text = student?.creditCardNo
        valueLabels[4].text = student?.location
        valueLabels[5].text = student?.phoneNumber
        valueLabels[6].text = student?.emailAddr
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteStudent(_ sender: Any) {
//        let fetch:NSFetchRequest<Student> = student.fetchRequest()
//        fetch.predicate = NSPredicate(format: "name = %@", tfName.text!)
//        
//        
//        
//        let persons = try? context.fetch(fetch)
//        if let p = persons?.first{
//            context.delete(p)
//        }

        context.delete(student!)
        dismiss(animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        appDelegate.saveContext()
        if segue.identifier == "update"{
            let secVC = segue.destination as! UpdateViewController
            secVC.student = student
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func returnToSInfoList(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
