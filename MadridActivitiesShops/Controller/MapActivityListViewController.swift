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

        let downloadActivityInteractor: DownloadAllActivitiesInteractor = DownloadAllActivitiesInteractorNSURLSessionImpl()
        
        downloadActivityInteractor.execute { (activities: Activities) in
            self.activities = activities
            
            self.activityCollectionView.delegate = self
            self.activityCollectionView.dataSource = self
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let activity = self.activities?.get(index: indexPath.row)
        self.performSegue(withIdentifier: "ShowActivityDetailSegue", sender: activity)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowActivityDetailSegue" {
            
            let vc = segue.destination as! ActivityDetailViewController
            vc.activity = sender as! Activity
        }
    }
}
