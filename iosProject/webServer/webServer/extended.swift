//
//  extended.swift
//  webServer
//
//  Created by Groom on 2019/4/28.
//  Copyright © 2019年 Groom. All rights reserved.
//

import Foundation
import UIKit
extension UIImageView{
    func downloadFrom(url: String){
        do{
            let urlNet = URL(string: url)
            let nsd = try Data(contentsOf: urlNet!)
            self.image = UIImage(data: nsd, scale: 1)
            self.contentMode = .scaleAspectFit
            
        }catch{
            print("image \(url) load error")
        }
    }
    func downLoadAsyncFrom(url:String){
        do{
            let urlNet = URL(string: url)
            let task = try URLSession.shared.dataTask(with: urlNet!)
            {(data, response, error) in
                if let nsd = data{
                    DispatchQueue.main.async{
                    self.image = UIImage(data: nsd, scale: 1)
                    self.contentMode = .scaleAspectFit
                    }

                }
            }
            task.resume()
        }catch{
        print("image \(url) load error")
        }
    }
}
