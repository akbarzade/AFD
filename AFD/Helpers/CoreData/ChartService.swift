//
//  ChartService.swift
//  AFD
//
//  Created by AmirHooshang Akbarzade on 7/8/16.
//  Copyright © 2016 Akbarzade. All rights reserved.
//

import Foundation

import Foundation
import UIKit
import CoreData


class ChartService {
  init() {
  }
  // MARK: Constant Defination's

  let airportService = AirportService()
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
   Inserting Method to import Airports List from passed JSON file.
   
   - parameters:
   - returns: NoReturn.
   */
  func insertJSONCharts(chartsFileURL: NSURL) throws {
    LogHandler.Log()
    
    let data = NSData(contentsOfURL: chartsFileURL)
    do{
      
      
      let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
      
      let jsonArray = jsonResult.valueForKey("Chart") as! NSArray
      
      for chart in jsonArray{
        let chartEntity = NSEntityDescription.insertNewObjectForEntityForName(
          "Chart", inManagedObjectContext: self.coreDataHelper.backgroundContext!) as! Chart
        
        let airportICAO = chart["airportICAO"] as! String
        let chartType = chart["chartType"] as! NSNumber
        //let chartRunway = chart["chartRunway"] as! String
        let chartIndex = chart["chartIndex"] as! String
        let chartChecked = NSNumber(bool: chart["chartChecked"] as! Bool)
        let chartId: String = "\(airportICAO)|\(chartType)|\(chartIndex)|\(chartChecked)"
        let chartImageName = "\(airportICAO)\(chartType)\(chartIndex)"
        let chartImage = UIImage(named: chartImageName)
        let imageData = UIImagePNGRepresentation(chartImage!)
        
        
        /*
         "chartInfo": {
         "chartImageWidth": 530,
         "chartImageHeight": 900,
         "locationDegreeLeftSide": 0,
         "locationDegreeRightSide": 0,
         "locationDegreeTopSide": 0,
         "locationDegreeButtonSide": 0
         */
        
        chartEntity.chartId = chartId as String
        chartEntity.airportICAO = airportICAO as String
        chartEntity.chartType = chartType as NSNumber
        chartEntity.chartIndex = chartIndex as String
        chartEntity.chartDescription = chart["chartDescription"] as!  String
        chartEntity.isLocational = NSNumber(bool: chart["isLocational"] as! Bool)
        chartEntity.chartChecked = chartChecked
        //chartEntity.chartImage = imageData
        chartEntity.timeStamp = NSDate()
        
        // MARK: - Fetching and Adding Airport to Chart From Available Airport on CoreData
        let airportsFetchRequest = NSFetchRequest(entityName: "Airport")
        let airports = (try self.coreDataHelper.backgroundContext!.executeFetchRequest(airportsFetchRequest)) as! [Airport]
        let airport =  airports.filter({ (a: Airport) -> Bool in
          return a.airportICAO == airportICAO
        }).first

        chartEntity.airport = airport
        
        
        // MARK: - Fetching and Adding ChartContent to Chart From JSON
        let chartContentEntity = NSEntityDescription.insertNewObjectForEntityForName(
          "ChartContent", inManagedObjectContext: self.coreDataHelper.backgroundContext!) as! ChartContent
        
        
        chartContentEntity.chartImage  = imageData!
        //(chart["chartContent"] as! NSDictionary)["chartImage"] as? NSData
        
        chartEntity.chartContent = chartContentEntity
        
        
        // MARK: - Fetching and Adding ChartInfo to Chart From JSON
        let chartInfoEntity = NSEntityDescription.insertNewObjectForEntityForName(
          "ChartInfo", inManagedObjectContext: self.coreDataHelper.backgroundContext!) as! ChartInfo
        
        chartInfoEntity.chartRunway = (chart["chartInfo"] as! NSDictionary)["chartRunway"] as? String
        chartInfoEntity.chartImageWidth = (chart["chartInfo"] as! NSDictionary)["chartImageWidth"] as! NSNumber
        chartInfoEntity.chartImageHeight = (chart["chartInfo"] as! NSDictionary)["chartImageHeight"] as! NSNumber
        chartInfoEntity.locationDegreeLeftSide = (chart["chartInfo"] as! NSDictionary)["locationDegreeLeftSide"] as? NSNumber
        chartInfoEntity.locationDegreeRightSide = (chart["chartInfo"] as! NSDictionary)["locationDegreeRightSide"] as? NSNumber
        chartInfoEntity.locationDegreeTopSide = (chart["chartInfo"] as! NSDictionary)["locationDegreeTopSide"] as? NSNumber
        chartInfoEntity.locationDegreeButtonSide = (chart["chartInfo"] as! NSDictionary)["locationDegreeButtonSide"] as? NSNumber
        
        chartEntity.chartInfo = chartInfoEntity
        
      }
      coreDataHelper.saveContext()
      
    } catch {
      fatalError("Error in inserting Airports from JSON file.")
    }
    
    let chartRequest = NSFetchRequest(entityName: "Chart")
    let chartInfoRequest = NSFetchRequest(entityName: "ChartInfo")
    let chartContentRequest = NSFetchRequest(entityName: "ChartContent")
    
    let ChartCount = coreDataHelper.backgroundContext!.countForFetchRequest(chartRequest, error: NSErrorPointer.init())
    
    let ChartContentCount = coreDataHelper.managedObjectContext.countForFetchRequest(chartContentRequest, error: NSErrorPointer.init())
    
    let ChartInfoCount = coreDataHelper.managedObjectContext.countForFetchRequest(chartInfoRequest, error: NSErrorPointer.init())
    
    print("Total Charts: \(ChartCount) \nwith Total ChartContents: \(ChartContentCount) \nwith Total ChartInfos: \(ChartInfoCount)")
    
  }
  
  
  //
  // MARK: - READ
  func GetDefaultChartId(onAirportICAO airportICAO: String) throws -> String {
    LogHandler.Log()
    return ""
  }
  
  
  func ValidateChart(chartId: String) throws -> Bool {
    LogHandler.Log()
    return false
  }
  
  func GetChart(chartId: String) throws -> Chart {
    LogHandler.Log()
    let airportChart = Chart()
    return airportChart
  }
  
  func GetCharts(onAirportICAO AirportICAO: String) throws -> [Chart] {
    LogHandler.Log()
    let airportCharts: [Chart] = Array()
    
    
//    airportCharts.appendContentsOf(GetTypeCharts(AirportICAO, chartType: ChartType.REF))
//    airportCharts.appendContentsOf(GetTypeCharts(AirportICAO, chartType: ChartType.STAR))
//    airportCharts.appendContentsOf(GetTypeCharts(AirportICAO, chartType: ChartType.APP))
//    airportCharts.appendContentsOf(GetTypeCharts(AirportICAO, chartType: ChartType.TAXI))
//    airportCharts.appendContentsOf(GetTypeCharts(AirportICAO, chartType: ChartType.SID))
    
    return airportCharts
  }
  
  func GetAirportCharts(onAirportICAO DisplayedAirport: String) throws -> [Chart] {
    LogHandler.Log()
    let airportCharts = [Chart]()
    return airportCharts
  }
  
  
  func ChartsCount() throws -> Int {
    LogHandler.Log()
    return 0
  }
  
  func ChartsCountForAirport(forAirport airportICAO: String) throws -> Int {
    LogHandler.Log()
    return 0
  }
  
  func GetChartCountByType(forAirport airportICAO: String, forChartType chartType: String) throws -> Int{
    LogHandler.Log()
    return 0
  }
  
  func GetChartRunwayCountByType(forAirport ICAO: String, forChartType chartType: String ,forChartRunway Runway: String) throws -> Int {
    LogHandler.Log()
    return 0
  }
  
  func GetTypeChartsId(ICAO: String ,chartType: ChartType) throws -> [String] {
    LogHandler.Log()
    let chartsId: [String] = Array<String>()
    return chartsId
  }
  
  
  func GetCheckedTypeChartsId(ICAO: String ,chartType: ChartType) throws -> [String] {
    LogHandler.Log()
    let chartsId: [String] = Array<String>()
    return chartsId
  }
  
  
  func GetChartsCountByType(ICAO: String, ChartType: String) throws -> Int{
    LogHandler.Log()
    return 0
  }
  
  func GetCheckedChartsCountByType(ICAO: String, ChartType: String) throws -> Int{
    LogHandler.Log()
    return 0
  }
  
  
  func GetCheckedTypeCharts(ICAO: String , chartType: String) throws -> [Chart]{
    LogHandler.Log()
    let charts = [Chart]()
    return charts
  }
  
  //
  // MARK: - Sections
  /**
   Available Section's in ChartType as Runways
   
   - Parameter ICAO: Current Selected Airport ICAO as Strign
   - Parameter chartType: ChartType to fetch section's as StringValue
   - Return: An array of Strings
   */
  func GetTypeCharts(ICAO: String , chartType: ChartType) throws -> [Chart]{
    LogHandler.Log()
    let Charts = [Chart]()
    return Charts
  }
  
  func GetTypeCharts(ICAO: String , chartType: String, sectionName: String) throws -> [Chart]{
    LogHandler.Log()
    let Charts = [Chart]()
    return Charts
  }
  
  func loadCharts(ICAO: String , chartType: String) throws -> [Chart] {
    LogHandler.Log()
    let Charts = [Chart]()
    return Charts
  }
  
  
  // MARK: UPDATE
  func updateChartCheckStatus(onChartId chartId: String, setCheckStatusTo checkStatus: Bool) throws {
    LogHandler.Log()
  }
  
  // MARK: DELETE
  
  func DeleteChart(ICAO: String , chartType: String) throws {
    LogHandler.Log()
  }
  
  func DeleteCharts() throws {
    LogHandler.Log()
  }
  
}