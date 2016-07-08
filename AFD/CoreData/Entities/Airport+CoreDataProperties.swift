//
//  Airport+CoreDataProperties.swift
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

extension Airport {

    @NSManaged var airportCountry: String
    @NSManaged var airportICAO: String
    @NSManaged var airportName: String
    @NSManaged var airportCity: String
    @NSManaged var airportIATA: String?
    @NSManaged var airportLocationLatitude: NSNumber
    @NSManaged var airportLocationLongitude: NSNumber
    @NSManaged var airportRunways: String?
    @NSManaged var timeStamp: NSDate
    
    @NSManaged var airportCharts: NSSet?

}
