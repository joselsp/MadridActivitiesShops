//
//  ActivityCell.swift
//  MadridActivitiesShops
//
//  Created by Jose Luis Solis Pino on 30/9/17.
//  Copyright © 2017 Jose Luis Solis Pino. All rights reserved.
//

import UIKit

class ActivityCell: UICollectionViewCell {
    var activity: Activity?
    
   
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    func refresh(activity: Activity) {
        self.activity = activity
        
        self.label.text = activity.name
    }
}
