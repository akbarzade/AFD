//
//  AirportService.swift
//  AFD
//
//  Created by AmirHooshang Akbarzade on 7/8/16.
//  Copyright © 2016 Akbarzade. All rights reserved.
//

import Foundation
import CoreData


/**
 This is a Class to handle Airport Entities on CoreData
 
 - Function	newAirport:
 - Function	insertAirport:
 - Function	insertAirports:
 */
class AirportService {
  init() {
  }
  
  // MARK: Constant Defination's
  // Core Data Store
  lazy var coreDataStore: CoreDataStore = {
    let coreDataStore = CoreDataStore()
    return coreDataStore
  }()
  // Core Data Helper
  lazy var coreDataHelper: CoreDataHelper = {
    let coreDataHelper = CoreDataHelper()
    return coreDataHelper
  }()
  
  var error: NSError? = nil
  
  // MARK: CREATE
  /**
   Function newAirport to insert new Airport into the CoreData
   
   -	Parameter	airport: An AirportModel with the Airport Entity properties
   */
  
  func newAirport(airport: Airport) throws {
  }
  
  /// Same as insertJSONAirports function but throws error if there is a nil value on JSON data.
  func InsertAirport(airportsFileURL: NSURL) throws {
    let data = NSData(contentsOfURL: airportsFileURL)!
    do{
      
      let jsonResult = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
      
      let jsonArray = jsonResult.valueForKey("Airport") as! NSArray
      
      for airport in jsonArray{
        guard (airport["airportCountry"]) != nil else { throw AirportError.InvalidData("airportCountry Key fails")}
        guard (airport["airportICAO"]) != nil else { throw AirportError.InvalidData("airportICAO Key fails")}
        guard (airport["airportName"]) != nil else { throw AirportError.InvalidData("airportName Key fails")}
        guard (airport["airportCity"]) != nil else { throw AirportError.InvalidData("airportCity Key fails")}
        guard (airport["airportIATA"]) != nil else { throw AirportError.InvalidData("airportIATA Key fails")}
        guard (airport["airportRunways"]) != nil else { throw AirportError.InvalidData("airportRunways Key fails")}
        guard (airport["airportLocationLongitude"]) != nil else { throw AirportError.InvalidData("airportLocationLongitude Key fails")}
        guard (airport["airportLocationLatitude"]) != nil else { throw AirportError.InvalidData("airportLocationLatitude Key fails")}
        
        let airportEntity = NSEntityDescription.insertNewObjectForEntityForName(
          "Airport", inManagedObjectContext: self.coreDataHelper.backgroundContext!) as! Airport
        
        airportEntity.airportCountry = airport["airportCountry"] as! String
        airportEntity.airportICAO = airport["airportICAO"] as! String
        airportEntity.airportName = airport["airportName"] as! String
        airportEntity.airportCity = airport["airportCity"] as! String
        airportEntity.airportIATA = airport["airportIATA"] as? String
        airportEntity.airportRunways = airport["airportRunways"] as? String
        airportEntity.airportLocationLongitude = airport["airportLocationLongitude"] as! NSNumber
        airportEntity.airportLocationLatitude = airport["airportLocationLatitude"] as! NSNumber
        airportEntity.timeStamp = NSDate()
        
      }
      coreDataHelper.saveContext()
      
    } catch {
      fatalError("Error in inserting Airports from JSON file.")
    }
    
    let request = NSFetchRequest(entityName: "Airport")
    let AirportCount = coreDataHelper.managedObjectContext.countForFetchRequest(request, error: nil)
    print("Total inserted Airports are: \(AirportCount)")
    
  }
  
  func insertAirports(airports: [Airport]) throws {
  }
  
  /**
   Inserting Method to import Airports List from passed JSON file.
   
   - parameter airportsFileURL: String Address of JSON file.
   
   - returns: NO RETURNS
   */
  
  func insertJSONAirports(airportsFileURL: NSURL) throws {
    
  }
  
  //
  // MARK: READ
  
  func GetAirport(airportICAO: String) throws -> Airport {
    let airport = Airport()
    return airport
  }
  
  func GetAirports() throws -> [Airport] {
    let airports = [Airport]()
    
    return airports
  }
  
  func AirportsCount() throws -> Int {
    return 0
  }
  
  func AirportsCount(forCountry CountryName: String) throws -> Int {
    return 0
  }
  
  // MARK: UPDATE
  func UpdateAirport(ICAO: String) throws {
  }
  
  // MARK: DELETE
  func DeleteAirport(ICAO: String) throws {
  }
  func DeleteAirports() throws {
  }
}