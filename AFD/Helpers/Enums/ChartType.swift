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
  case CO = 2
  case STAR = 3
  case APP = 4
  case TAXI = 5
  case SID = 6
  
  func TypeIndex() -> Int {
    LogHandler.Log()
    switch self {
    case .REF:
      return 1
    case .CO:
      return 2
    case .STAR:
      return 3
    case .APP:
      return 4
    case .TAXI:
      return 5
    case .SID:
      return 6

    }
  }
  
  func fullTypeName() -> String {
    LogHandler.Log()
    switch self {
    case .REF:
      return "REFERENCE Charts"
    case .CO:
      return "COMPANY Charts"
    case .STAR:
      return "ARRIVALS Charts"
    case .APP:
      return "APPROACH Charts"
    case .TAXI:
      return "TAXI Charts"
    case .SID:
      return "DEPARTURES Charts"
    }
  }
}