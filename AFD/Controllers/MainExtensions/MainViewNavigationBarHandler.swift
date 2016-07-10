//
//  MainViewNavigationBarHandler.swift
//  AFD
//
//  Created by AmirHooshang Akbarzade on 7/10/16.
//  Copyright © 2016 Akbarzade. All rights reserved.
//

import Foundation
import UIKit


extension MainViewController  {
  
  
  
  // MARK: - Top Side Navigation Bar
  @IBAction func mainNavigationBarManualButton(sender: AnyObject){
    LogHandler.Log()
    ManualPopOverHandler(sender)
  }
  
  @IBAction func mainNavigationBarNavigationButton(sender: AnyObject) {
    LogHandler.Log()
    LocationPopOverHandler(sender)
  }
  
  @IBAction func mainNavigationBarSettingsButton(sender: AnyObject) {
    LogHandler.Log()
    SettingsPopOverHandler(sender)
  }
  
  @IBAction func informationNavigationBarSettingsButton(sender: AnyObject) {
    LogHandler.Log()
    InformationPopOverHandler(sender)
  }
  func ManualPopOverHandler(sender: AnyObject){
    LogHandler.Log()
  }
  func SettingsPopOverHandler(sender: AnyObject){
    LogHandler.Log()
  }
  
  func LocationPopOverHandler(sender: AnyObject){
    LogHandler.Log()
  }
  
  func InformationPopOverHandler(sender: AnyObject){
    LogHandler.Log()
  }
}