//
//  MapShops.swift
//  MadridActivitiesShops
//
//  Created by Jose Luis Solis Pino on 30/9/17.
//  Copyright © 2017 Jose Luis Solis Pino. All rights reserved.
//

import CoreData

func mapShopCDIntoShop(shopCD: ShopCD) -> Shop {
    // mapping shopCD into shop
    let shop = Shop(name: shopCD.name!)
    shop.address = shopCD.address ?? ""
    shop.image = shopCD.image ?? ""
    shop.logo = shopCD.logo ?? ""
    
    shop.latitude = shopCD.latitude
    shop.longitude = shopCD.longitude
    shop.description = shopCD.description_en ?? ""
    shop.openingHours = shopCD.openingHours ?? ""
    
    return shop
}

func mapShopIntoShopCD(context: NSManagedObjectContext, shop: Shop) -> ShopCD {
    // mapping shop into ShopCD
    let shopCD = ShopCD(context: context)
    shopCD.name = shop.name
    shopCD.address = shop.address
    shopCD.image = shop.image
    shopCD.logo = shop.logo
    
    shopCD.latitude = shop.latitude ?? 0.0
    shopCD.longitude = shop.longitude ?? 0.0
    shopCD.description_en = shop.description
    shopCD.openingHours = shop.openingHours
    
    return shopCD
}
