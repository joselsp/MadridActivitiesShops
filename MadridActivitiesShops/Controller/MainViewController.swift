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

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var showShopsButton: UIButton!
    @IBOutlet weak var showActivitiesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let reachability = Reachability()!
        
        initDownloadData()
        
        ExecuteOnceInteractorImpl(elementTypeKey: Constant.shopTypeKey).execute (closure: {
            if reachability.connection == .none{
                let alertController = UIAlertController(title: "No Internet connection", message: "There is no Internet Connection", preferredStyle: .alert)
                
                alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {
                    alert -> Void in
                    //Code
                }))
                
                present(alertController, animated: true, completion: {
                    OperationQueue.main.addOperation {
                        self.activityIndicator.isHidden = true
                        self.activityIndicator.stopAnimating()
                    }
                })
                
            } else {
                initializeShopData()
            }
        }, cached: {
            self.finishedDownloadedData()
        })
    }
    
    func initializeShopData() {
        let downloadShopInteractor: DownloadAllShopsInteractor = DownloadAllShopsInteractorNSURLSessionImpl()
        
        downloadShopInteractor.execute (onSuccess: { (shops: Shops) in
            let cacheInteractor = SaveAllShopsInteractorImpl()
            cacheInteractor.execute(shops: shops, context: self.context, onSuccess: { (shops: Shops)
                in
                SetExecutedOnceInteractorImpl(elementTypeKey: Constant.shopTypeKey).execute()
                
                ExecuteOnceInteractorImpl(elementTypeKey: Constant.activityTypeKey).execute(closure: {
                    self.initializeActivityData()
                }, cached: {
                    self.finishedDownloadedData()
                })
                
            }) { (onError: Error) in
                print("Error caching Shops")
                self.finishedDownloadedData()
            }
        }) { (onError: Error) in
            print("Error downloading Shops")
            self.finishedDownloadedData()
        }
    }
    
    func initializeActivityData() {
        let downloadActivityInteractor: DownloadAllActivitiesInteractor = DownloadAllActivitiesInteractorNSURLSessionImpl()
        
        downloadActivityInteractor.execute (onSuccess: { (activities: Activities) in
            
            let cacheInteractor = SaveAllActivitiesInteractorImpl()
            cacheInteractor.execute(activities: activities, context: self.context, onSuccess: { (activities: Activities)
                in
                
                SetExecutedOnceInteractorImpl(elementTypeKey: Constant.activityTypeKey).execute()
                
                self.finishedDownloadedData()
                
            }) { (onError: Error) in
                print("Error caching Activities")
                self.finishedDownloadedData()
            }
        }) { (onError: Error) in
            print("Error downloading Activities")
            self.finishedDownloadedData()
        }
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
    
    func initDownloadData() {
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        self.showShopsButton.isEnabled = false
        self.showActivitiesButton.isEnabled = false
    }
    
    func finishedDownloadedData() {
        OperationQueue.main.addOperation {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.showShopsButton.isEnabled = true
            self.showActivitiesButton.isEnabled = true
        }
    }
}
