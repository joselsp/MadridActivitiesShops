//
//  MapShopListViewController.swift
//  MadridActivitiesShops
//
//  Created by Jose Luis Solis Pino on 30/9/17.
//  Copyright © 2017 Jose Luis Solis Pino. All rights reserved.
//

import UIKit

class MapShopListViewController: UIViewController {
    
    var shops: Shops?

    @IBOutlet weak var shopCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let downloadShopInteractor: DownloadAllShopsInteractor = DownloadAllShopsInteractorNSURLSessionImpl()
            
        downloadShopInteractor.execute { (shops: Shops) in
            self.shops = shops
            
            self.shopCollectionView.delegate = self
            self.shopCollectionView.dataSource = self
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shop = self.shops?.get(index: indexPath.row)
        self.performSegue(withIdentifier: "ShowShopDetailSegue", sender: shop)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowShopDetailSegue" {
            
            let vc = segue.destination as! ShopDetailViewController            
            vc.shop = sender as! Shop
        }
    }
}

