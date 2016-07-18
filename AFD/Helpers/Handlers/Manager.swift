//
//  Manager.swift
//  AFD
//
//  Created by AmirHooshang Akbarzade on 7/8/16.
//  Copyright © 2016 Akbarzade. All rights reserved.
//

import Foundation
import UIKit

struct Manager {
  
  static var DeviceOrientation : UIInterfaceOrientation! {
    willSet{
      print("Manager.DeviceOrientation: Orientation is \(DeviceOrientation) and WillSet to \(newValue)")
    }
    didSet{
      print("Manager.DeviceOrientation: Old value of Orientation is  \(oldValue) and Now it's seted to \(DeviceOrientation)")
    }
  }
  
  static var State: AppState! {
    willSet{
      print("Manager.State: State is \(State) and WillSet to \(newValue)")
    }
    didSet{
      print("Manager.State: Old value of State is  \(oldValue) and Now it's seted to \(State)")
      Defaults[.AppState] = State.rawValue
    }
  }
  
  static var AppStateValue: AppState {
    return State ?? AppState.Initiate
  }
  
  
  // MARK: - Airport
  static var AirportObject: Airport! {
    willSet {
    }
    didSet {
    }
  }
  
  static var AirportICAO: String! {
    willSet {
      print("Manager.Airport: Airport is \(AirportICAO) and WillSet to \(newValue)")
    }
    didSet{
      print("Manager.Airport: Old value of Airport is  \(oldValue) and Now it's seted to \(AirportICAO)")
      Defaults[.Airport] = AirportICAO
      
      NSNotificationCenter.defaultCenter().postNotificationName(NotificationKey.AirportSelectionNotificationKey, object: nil)
    }
  }
  
  // MARK: - TerminalChart
  static var TerminalChartsTogglingStatus: Bool! {
    willSet{
      print("Manager.TerminalChartsTogglingStatus: Status is \(TerminalChartsTogglingStatus) and WillSet to \(newValue)")
    }
    didSet{
      print("Manager.TerminalChartsTogglingStatus: Old value of Status is  \(oldValue) and Now it's seted to \(TerminalChartsTogglingStatus)")
      Defaults[.TerminalChartsTogglingStatus] = TerminalChartsTogglingStatus
      if TerminalChartsTogglingStatus != oldValue {
        NSNotificationCenter.defaultCenter().postNotificationName(NotificationKey.TerminalChartsTogglingStatusChangeNotificationKey, object: nil)
      }
    }
  }
  
  /**
   TerminalType Represented Current TerminalChartType
   
   - Note: Set it when Chart type button selected,
   - Note: Set it when the value of variable ChartId seted or changed by decoding ChartId value
   - Note: each time the value of TerminalType setedor changed it must send a notification to manage Circle Pointer to present the correct chart type on user interface.
   */
  static var TerminalType: ChartType! {
    willSet {
      print("Manager.TerminalChartType: Airport is \(TerminalType) and WillSet to \(newValue)")
    }
    didSet{
      Defaults[.TerminalType] = TerminalType.TypeIndex()
      
      print("Manager.TerminalChartType: Old value of Airport is  \(oldValue) and Now it's seted to \(TerminalType)")
      print("Manager: Terminal Chart Seted \(TerminalType.fullTypeName())")
    }
  }
  
  /// An Array of Chart Object with ChartType of 'REF'
  static var ChartObjects1: [Chart] = []
  
  /// An Array of Chart Object with ChartType of 'STAR'
  static var ChartObjects2: [Chart] = []
  
  /// An Array of Chart Object with ChartType of 'APP'
  static var ChartObjects3: [Chart] = []
  
  /// An Array of Chart Object with ChartType of 'TAXI'
  static var ChartObjects4: [Chart] = []
  
  /// An Array of Chart Object with ChartType of 'SID'
  static var ChartObjects5: [Chart] = []
  
  /// An Array Of Chart Objects to Hold All Chart for the current represented Airport
  static var TerminalCharts: [Chart] = []
  
  /// An Array of String to hold all the ChartId's of current represented Airport
  static var TerminalChartsId: [String] = []

  
  // MARK: - Chart
  /**
   Represented A Chart entity chartId properties as String value
   */
  static var ChartObject: Chart!
  
  /**
   Represented A Chart entity 'Id' that selected or displayed right away
   */
  static var ChartId: String! {
    willSet{
      print("Manager.ChartId: ChartId is \(ChartId) and WillSet to \(newValue)")
    }
    didSet{
      print("Manager.ChartId: Old value of ChartId is  \(oldValue) and Now it's seted to \(ChartId)")
      Defaults[.ChartId] = ChartId
      
      print("Manager.ChartId: TerminalChartSelectionNotificationKey")
      NSNotificationCenter.defaultCenter().postNotificationName(NotificationKey.TerminalChartSelectionNotificationKey, object: nil)
      
      print("Manager: ChartId StatusBarUpdateIndex")
      NSNotificationCenter.defaultCenter().postNotificationName(NotificationKey.StatusBarUpdateIndex, object: nil)
    }
  }
  
  //	static var UserLocationLatitude: Double = Double()
  //	static var UserLocationLongitude: Double = Double()
  
  static var NextChartId: String!
  static var PreviousChartId: String!
  static var CheckedCharts: [String] = []
  
  
  
  /**
   TypeOfChart: Find The Correct value of ChartType Enum for the ChartId
   - parameter ChartId: Holding the Id of terminal chart that will be calculated on
   - returns: Returning one of the cases in ChartType Enum
   
   - Precondition: No Condition
   - Postcondition: The result is 'equal' to 'ChartType.REF' or 'ChartType.STAR' or 'ChartType.APP' or 'ChartType.TAXI' or 'ChartType.SID'.
   - Requires: None
   - Note: None
   - SeeAlso: ChartType
   - Warning: None
   - Throws: Cannot do the job if chartId was incorrect.
   */
//  static func TypeOfChart(forChartId chartId: String) -> ChartType {
//    LogHandler.Log()
//    let chartType: String = (ChartId.componentsSeparatedByString("|"))[1]
//    return ValueForStringChartType(chartType)
//  }
}