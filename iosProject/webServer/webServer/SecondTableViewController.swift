//
//  SecondTableViewController.swift
//  webServer
//
//  Created by Groom on 2019/4/28.
//  Copyright © 2019年 Groom. All rights reserved.
//

import UIKit

class SecondTableViewController: UITableViewController {

    var newsList:[Dictionary<String,String>]!
    func loadData(){
        do{
            let url = URL(string: "http://zy.whu.edu.cn:8081/api/try/newsList")
            let data = try Data(contentsOf: url!)
            let jsonData = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            newsList = (jsonData as! NSDictionary).value(forKey: "data") as? [Dictionary<String,String>]
        }catch{
            print("Load New error")
            }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        tableView.register(tableCellTableViewCell.self, forCellReuseIdentifier: "NewsCell")
        
        let xib = UINib(nibName: "tableCellTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "NewsCell")
        tableView.rowHeight = 120
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! tableCellTableViewCell
        cell.NewsTitle.text = newsList[indexPath.row]["title"]
        cell.NewsDate.text = newsList[indexPath.row]["updateTime"]
        let imageurl = newsList[indexPath.row]["picURL"]
        cell.NewsImage.downLoadAsyncFrom(url: imageurl!)
        // Configure the cell...

        return cell
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
