//
//  MapActivityListViewController.swift
//  MadridActivitiesShops
//
//  Created by Jose Luis Solis Pino on 30/9/17.
//  Copyright © 2017 Jose Luis Solis Pino. All rights reserved.
//

import UIKit
import CoreData

class MapActivityListViewController: UIViewController {

    var activities: Activities?
    var context: NSManagedObjectContext!
    
    @IBOutlet weak var activityCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ExecuteOnceInteractorImpl(elementTypeKey: Constant.activityTypeKey).execute {
            initializeData()
        }
        
        self.activityCollectionView.delegate = self
        self.activityCollectionView.dataSource = self
    }
    
    func initializeData() {
        let downloadActivityInteractor: DownloadAllActivitiesInteractor = DownloadAllActivitiesInteractorNSURLSessionImpl()
        
        downloadActivityInteractor.execute { (activities: Activities) in
            
            let cacheInteractor = SaveAllActivitiesInteractorImpl()
            cacheInteractor.execute(activities: activities, context: self.context, onSuccess: { (activities: Activities)
                in
                
                SetExecutedOnceInteractorImpl(elementTypeKey: Constant.activityTypeKey).execute()
                
                self._fetchedResultsController = nil
                self.activityCollectionView.delegate = self
                self.activityCollectionView.dataSource = self
                self.activityCollectionView.reloadData()
            })
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let activity: ActivityCD = self.fetchedResultsController.object(at: indexPath)
        self.performSegue(withIdentifier: "ShowActivityDetailSegue", sender: activity)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {        
        if segue.identifier == "ShowActivityDetailSegue" {
            let vc = segue.destination as! ActivityDetailViewController
            
            let activityCD: ActivityCD = sender as! ActivityCD
            vc.activity = mapActivityCDIntoActivity(activityCD: activityCD)
        }
    }
    
    // MARK: - Fetched results controller
    
    var _fetchedResultsController: NSFetchedResultsController<ActivityCD>? = nil
    
    var fetchedResultsController: NSFetchedResultsController<ActivityCD> {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        let fetchRequest: NSFetchRequest<ActivityCD> = ActivityCD.fetchRequest()
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        
        // Edit the sort key as appropriate.
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        _fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.context!, sectionNameKeyPath: nil, cacheName: "ActivitiesCacheFile")
        //        aFetchedResultsController.delegate = self
        
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return _fetchedResultsController!
    }
}
