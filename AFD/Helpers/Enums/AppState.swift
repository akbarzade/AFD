//
//  AppState.swift
//  AFD
//
//  Created by AmirHooshang Akbarzade on 7/8/16.
//  Copyright © 2016 Akbarzade. All rights reserved.
//

import Foundation
/**
 AppState reperesent the current state of the application
 
 - Throws: None
 - Todo: None for now
 - Author: **Amir Hooshang Akbarzade**
 - Note: Application State
 - SeeAlso: None
 */
enum AppState: Int {
  case Initiate
  case SeedData
  case Normal
  case UnKnown
  case Running
  case ResignActive
  case EnterBackground
  case EnterForeground
  case BecomeActive
  case Terminated
  case Crashed
}