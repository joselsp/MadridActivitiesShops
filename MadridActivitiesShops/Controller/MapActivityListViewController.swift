//
//  MapActivityListViewController.swift
//  MadridActivitiesShops
//
//  Created by Jose Luis Solis Pino on 30/9/17.
//  Copyright © 2017 Jose Luis Solis Pino. All rights reserved.
//

import UIKit

class MapActivityListViewController: UIViewController {

    var activities: Activities?
    
    @IBOutlet weak var activityCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let downloadActivityInteractor: DownloadAllActivitiesInteractor = DownloadAllActivitiesInteractorNSOpImpl()
        
        downloadActivityInteractor.execute { (activities: Activities) in
            self.activities = activities
            
            self.activityCollectionView.delegate = self
            self.activityCollectionView.dataSource = self
        }
    }
}
