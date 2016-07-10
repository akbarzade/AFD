//
//  MainSegue.swift
//  AFD
//
//  Created by AmirHooshang Akbarzade on 7/10/16.
//  Copyright © 2016 Akbarzade. All rights reserved.
//

import Foundation
import UIKit

extension MainViewController {
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    LogHandler.Log()
    
    if (segue.identifier == ""){
//      let airportsTVC = segue.destinationViewController as! AirportsTableViewController
//      airportsTVC.airportsDelegate = self
      print("Segue Detected as : \(segue.identifier!)")
    } else if (segue.identifier == "" ){
//      let terminalChartTVC = segue.destinationViewController as! TerminalChartTableViewController
//      mainSetTerminalViewDelegate = terminalChartTVC
      print("MVC: Segue Detected as : \(segue.identifier!)")
    } else {
      print("Segue not detected.")
    }
    
  }
}