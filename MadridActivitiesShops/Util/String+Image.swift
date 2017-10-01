//
//  String+Image.swift
//  MadridActivitiesShops
//
//  Created by Jose Luis Solis Pino on 30/9/17.
//  Copyright © 2017 Jose Luis Solis Pino. All rights reserved.
//

import UIKit
import SDWebImage

extension String {
    func loadImage(into imageView: UIImageView) {
        let queue = OperationQueue()
        queue.addOperation {
            //            let image = UIImage(named: "shopIcon")  // Mostramos icono por defecto
            if let url = URL(string: self),
                let data = NSData(contentsOf: url),
                let image = UIImage(data: data as Data) {
                
                OperationQueue.main.addOperation {
                    imageView.image = image
                }
            }
        }
    }
    
    func loadImageNSURLSession(into imageView: UIImageView) {
        let session = URLSession.shared
        if let url = URL(string: self) {
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                
                OperationQueue.main.addOperation {
                    
                    if error == nil {
                        // OK
                        let fileName = url.lastPathComponent
                        imageView.sd_setImage(with: url, placeholderImage: UIImage(contentsOfFile: fileName), completed: { (image: UIImage?, error: Error?, cacheType: SDImageCacheType, imageURL: URL?) in
                            if error == nil {
                                imageView.image = image
                            } else {
                                // Error
                                print("Error: \(error.debugDescription)")
                            }
                        })
                    } else {
                        // Error
                        print("Error: \(error.debugDescription)")
                    }
                }
            }
            task.resume()
        }
    }
}
