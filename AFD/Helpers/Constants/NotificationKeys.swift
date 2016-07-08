//
//  NotificationKeys.swift
//  AFD
//
//  Created by AmirHooshang Akbarzade on 7/8/16.
//  Copyright © 2016 Akbarzade. All rights reserved.
//

import Foundation

/**
 Static Struct To Holding Application NotificationKey's as Static Immutable Constant's
 */
struct NotificationKey {
  
  /// Call This Notification when selecting an Airport from Airport PopOp TableView
  static let AirportSelectionNotificationKey = "AirportSelectionNotificationKey"
  
  /// Call This Notification when selecting an TerminalChart Type Navigation on the left side of UI
  static let TerminalChartTypeSelectionNotificationKey = "com.akbarzade.AFD.TerminalChartTypeSelectionNotificationKey"
  
  /// Call This Notification when a TerminalChart Is Selected on the Table View Appeared on the left side of UI
  static let TerminalChartSelectionNotificationKey = "com.akbarzade.AFD.TerminalChartSelectionNotificationKey"
  
  /// Call This Notification when a TerminalChart CheckMark Value Is Changed by selecting that on the Table View Appeared on the left side of UI
  static let TerminalChartCheckedChangeNotificationKey = "TerminalChartCheckedChangeNotificationKey"
  
  /// Call This Notification When Application Initiate | Airport Selected | Airport Changed | TerminalChart Check Status Changes.
  static let StatusBarUpdate = "com.akbarzade.AFD.StatusBarUpdate"
  
  /// Call This Notification When Application Initiate | Airport Selected | Airport Changed | TerminalChart Type Navigation Button Changed | TerminalChart Selected | TerminalChart Check Status Changes.
  static let StatusBarUpdateIndex = "com.akbarzade.AFD.StatusBarUpdateIndex"
  
  
  static let NotificationKey = "com.akbarzade.AFD.NotificationKey"
}
