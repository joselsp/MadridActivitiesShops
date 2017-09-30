//
//  ActivityDetailViewController.swift
//  MadridActivitiesShops
//
//  Created by Jose Luis Solis Pino on 30/9/17.
//  Copyright © 2017 Jose Luis Solis Pino. All rights reserved.
//

import UIKit

class ActivityDetailViewController: UIViewController {

    var activity: Activity!
    
    @IBOutlet weak var activityDetailDescription: UITextView!
    @IBOutlet weak var activityImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = self.activity.name
        self.activityDetailDescription.text = self.activity.description
        self.activity.image.loadImage(into: activityImage)
    }
}
