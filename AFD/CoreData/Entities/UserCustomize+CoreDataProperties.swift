//
//  UserCustomize+CoreDataProperties.swift
//  AFD
//
//  Created by AmirHooshang Akbarzade on 7/8/16.
//  Copyright © 2016 Akbarzade. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension UserCustomize {

    @NSManaged var chartImageOrientation: NSNumber
    @NSManaged var chartImageOriginX: NSNumber?
    @NSManaged var chartImageOriginY: NSNumber?
    @NSManaged var chartImageScale: NSNumber
    @NSManaged var timeStamp: NSDate
    
    @NSManaged var chart: Chart?

}
