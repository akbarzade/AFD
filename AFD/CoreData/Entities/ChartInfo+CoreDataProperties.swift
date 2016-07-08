//
//  ChartInfo+CoreDataProperties.swift
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

extension ChartInfo {

    @NSManaged var chartImageHeight: NSNumber
    @NSManaged var chartImageWidth: NSNumber
    @NSManaged var chartImageOrientation: NSNumber
    
    @NSManaged var locationDegreeRightSide: NSNumber?
    @NSManaged var locationDegreeButtonSide: NSNumber?
    @NSManaged var locationDegreeTopSide: NSNumber?
    @NSManaged var locationDegreeLeftSide: NSNumber?
    
    @NSManaged var locationBeginPercentageLeftSide: NSNumber?
    @NSManaged var locationBeginPercentageRightSide: NSNumber?
    @NSManaged var locationBeginPercentageButtonSide: NSNumber?
    @NSManaged var locationBeginPercentageTopSide: NSNumber?
    
    @NSManaged var chartRunway: String?
    @NSManaged var timeStamp: NSDate
    
    @NSManaged var chart: Chart?

}
