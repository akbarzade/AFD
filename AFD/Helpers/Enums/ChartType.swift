//
//  ChartType.swift
//  AFD
//
//  Created by AmirHooshang Akbarzade on 7/8/16.
//  Copyright © 2016 Akbarzade. All rights reserved.
//

import Foundation

enum ChartType : Int {
  case REF = 1
  case STAR = 2
  case APP = 3
  case TAXI = 4
  case SID = 5
  case CO = 6
  
  func TypeIndex() -> Int {
    LogHandler.Log()
    switch self {
    case .REF:
      return 1
    case .STAR:
      return 2
    case .APP:
      return 3
    case .TAXI:
      return 4
    case .SID:
      return 5
    case .CO:
      return 6
    }
  }
  
  func fullTypeName() -> String {
    LogHandler.Log()
    switch self {
    case .REF:
      return "REFERENCE Charts"
    case .STAR:
      return "ARRIVALS Charts"
    case .APP:
      return "APPROACH Charts"
    case .TAXI:
      return "TAXI Charts"
    case .SID:
      return "DEPARTURES Charts"
    case .CO:
      return "COMPANY Charts"
    }
  }
}