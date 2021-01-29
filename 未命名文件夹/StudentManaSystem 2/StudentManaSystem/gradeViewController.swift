//
//  gradeViewController.swift
//  StudentManaSystem
//
//  Created by Groom on 2019/6/19.
//  Copyright © 2019年 Groom. All rights reserved.
//

import UIKit
import CoreData

class gradeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let cellIdentifier = "cellGrade"
    var grades:[Grade]?
    var student: Student?
    @IBOutlet weak var nmTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchGrade(_ sender: Any) {
        let fetch:NSFetchRequest<Student> = Student.fetchRequest()
        fetch.predicate = NSPredicate(format: "name = %@", nmTextField.text!)
        let students = try? context.fetch(fetch)
        if let s = students?.first{
            for i in 0...9 {
                
            let grd: Grade = Grade(context: context)
                switch i {
                case 0:
                    grd.course = "math"
                    grd.score = 88.5
                case 1:
                    grd.course = "c++"
                    grd.score = 89.5
                case 2:
                    grd.course = "ISD"
                    grd.score = 91.5
                case 3:
                    grd.course = "java"
                    grd.score = 92

                case 4:
                    grd.course = "c#"
                    grd.score = 89
                case 5:
                    grd.course = "OS"
                    grd.score = 90.5
                case 6:
                    grd.course = "CPT"
                    grd.score = 91.5
                case 7:
                    grd.course = "Max"
                    grd.score = 90
                case 8:
                    grd.course = "physic"
                    grd.score = 87
                case 9:
                    grd.course = "SP"
                    grd.score = 91
               
                default:
                    grd.course = "cf"
                    grd.score = 89
                    
                }
           
            s.addToStudent_grade(grd)
            
            }
            
            grades = s.student_grade?.allObjects as! [Grade]
            appDelegate.saveContext()
        }
        tableView.reloadData()
    }

    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return grades?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if(cell == nil){
            cell = UITableViewCell(style: .value1, reuseIdentifier: cellIdentifier)
        }
        
        cell?.textLabel?.text = grades?[indexPath.row].course
        cell?.detailTextLabel?.text = "\(String(describing: grades![indexPath.row].score))"
        return cell!
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
