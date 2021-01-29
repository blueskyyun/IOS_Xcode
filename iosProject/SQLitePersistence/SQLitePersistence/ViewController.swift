//
//  ViewController.swift
//  SQLitePersistence
//
//  Created by Groom on 2019/6/16.
//  Copyright © 2019年 Groom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lineFields:[UITextField]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var database:OpaquePointer? = nil
        let path = dataFilePath()
        print(path)
        var result = sqlite3_open(path, &database)
        if result != SQLITE_OK{
            sqlite3_close(database)
            
            print("failed to open database")
            return
        }
        let createSQL = "CREATE TABLE IF NOT EXISTS FIELDS" +
        "(ROW INTEGER PRIMARY KEY, FIELD_DATA TEXT);"
        var errMsg: UnsafeMutablePointer<Int8>? = nil
        result = sqlite3_exec(database, createSQL, nil, nil, &errMsg)
        if(result != SQLITE_OK){
            sqlite3_close(database)
            print("Failed to create table")
            return
        }
        
        let query = "SELECT ROW, FIELD_DATA FROM FIELDS ORDER BY ROW"
        var statement:OpaquePointer? = nil
        if sqlite3_prepare(database, query, -1, &statement, nil) == SQLITE_OK{
            while sqlite3_step(statement) == SQLITE_ROW{
                let row = Int(sqlite3_column_int(statement, 0))
                let rowData = sqlite3_column_text(statement, 1)
                //ley fieldValue =
                
                let value = rowData?.withMemoryRebound(to: Int8.self, capacity: 1, { ( ptr:UnsafePointer<Int8>) -> UnsafePointer<Int8> in
                    return ptr
                })
                let fieldValue = String(cString: value!, encoding: String.Encoding.utf8)
                lineFields[row].text = fieldValue
            }
            sqlite3_finalize(statement)
        }
        sqlite3_close(database)
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationWillResignActive(notification:)), name: NSNotification.Name.UIApplicationWillResignActive, object: app)
        
    }
    func applicationWillResignActive(notification: NSNotification){
        var database: OpaquePointer? = nil
        let result = sqlite3_open(dataFilePath(), &database)
        if result != SQLITE_OK{
            sqlite3_close(database)
             print("failed to open database")
            return
        }
        
        for i in 0..<lineFields.count{
            let field = lineFields[i]
            let update = "INSERT OR REPLACE INTO FIELDS (ROW, RIELD_DATA)" + "VALUES (?, ?);"
            var statement: OpaquePointer? = nil
            if sqlite3_prepare_v2(statement, update, -1, &statement, nil) == SQLITE_OK {
                let text = field.text
                sqlite3_bind_int(statement,1, Int32(i))
                sqlite3_bind_text(statement, 2, text!, -1, nil)
            }
            if sqlite3_step(statement) != SQLITE_DONE{
                print("Error updating table")
                sqlite3_close(statement)
                return
            }
            sqlite3_finalize(statement)
        }
        
        sqlite3_close(database)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func dataFilePath() -> String{
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        //        let urls = FileManager.default.urlsForDirectory(
        //            .documentDirectory, inDomains: .userDomainMask)
        var url:String?
        url = ""
            // create a blank path
        do {
            
            try url = urls.first?.appendingPathComponent("data.plist").path
        } catch  {
            print("Error is \(error)")
        }
        return url!
    }
}

