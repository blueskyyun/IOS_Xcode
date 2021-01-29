//
//  StudentInfoTableViewController.swift
//  StudentManaSystem
//
//  Created by Groom on 2019/6/17.
//  Copyright © 2019年 Groom. All rights reserved.
//

import UIKit
import CoreData

class StudentInfoTableViewController: UITableViewController{

      @IBOutlet weak var textField: UITextField!
    
    @IBAction func searchBtnClick(_ sender: Any) {
        //取消第一响应者相应事件
//        UIApplication.shared.sendAction(#selector(resignFirstResponder), to: nil, from: nil, for: nil)
        
        if let str = textField.text{
            let fetch:NSFetchRequest<Student> = Student.fetchRequest()
            fetch.predicate = NSPredicate(format: "name = %@", str)
            
            
          
            students = try? context.fetch(fetch)
//            if let s = students?.first{
//                print(s.name ?? "haven't found")
//            }
            self.tableView.reloadData()
//            DispatchQueue.main.async(execute: { () -> Void in
//                //gContactViewController?.contactTableView.reloadData()
//                
//               
//                self.viewDidLoad()
//               
//                
//            })
            }
    }
    
       
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var students:[Student]?
   
    fileprivate func relowdData(){
        
        let fetch:NSFetchRequest<Student> = Student.fetchRequest()
        
        fetch.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        students = try? context.fetch(fetch)
        tableView.reloadData()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
               // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        let fetch:NSFetchRequest<Student> = Student.fetchRequest()
        fetch.predicate = NSPredicate(format: "name = ''")
        
        
        
        let sts = try? context.fetch(fetch)
        for i in 0..<sts!.count {
            
            context.delete(sts![i])
            
        }
        appDelegate.saveContext()
//        appDelegate.saveContext()
        relowdData()

        
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return students?.count ?? 0    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let s = students?[indexPath.row]{
            cell.textLabel?.text = s.name
            cell.detailTextLabel?.text = s.school
            
        }

        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        relowdData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        appDelegate.saveContext()
        if segue.identifier == "detail"{
            let secVC = segue.destination as! DetailViewController
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell),let stu = students?[indexPath.row]{
                secVC.student = stu
            }
            
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
