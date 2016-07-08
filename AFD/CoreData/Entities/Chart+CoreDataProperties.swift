//
//  Chart+CoreDataProperties.swift
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

extension Chart {

    @NSManaged var chartId: String
    @NSManaged var airportICAO: String
    @NSManaged var chartChecked: NSNumber
    @NSManaged var chartIndex: String
    @NSManaged var chartDescription: String
    @NSManaged var chartType: NSNumber
    @NSManaged var isLocational: NSNumber
    @NSManaged var timeStamp: NSDate
    
    @NSManaged var airport: Airport?
    @NSManaged var chartContent: ChartContent?
    @NSManaged var chartInfo: ChartInfo?
    @NSManaged var userCustomize: UserCustomize?

}
