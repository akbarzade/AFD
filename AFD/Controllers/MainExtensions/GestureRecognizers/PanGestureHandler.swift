//
//  PanGestureHandler.swift
//  AFD
//
//  Created by AmirHooshang Akbarzade on 7/10/16.
//  Copyright © 2016 Akbarzade. All rights reserved.
//

import Foundation
import UIKit

extension MainViewController {
  
  func TerminalChartPanGestureHandler(sender: UIPanGestureRecognizer){
    LogHandler.Log()
    sender.minimumNumberOfTouches = 1
    sender.maximumNumberOfTouches = 1
  }
}