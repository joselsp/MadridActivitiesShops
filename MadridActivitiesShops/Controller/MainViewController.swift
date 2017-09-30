//
//  MainViewController.swift
//  MadridActivitiesShops
//
//  Created by Jose Luis Solis Pino on 30/9/17.
//  Copyright © 2017 Jose Luis Solis Pino. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    
    var context: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowShopsSegue" {
            let vc = segue.destination as! MapShopListViewController
            vc.context = self.context
        }
        if segue.identifier == "ShowActivitiesSegue" {
            let vc = segue.destination as! MapActivityListViewController
            vc.context = self.context
        }
    }
}
