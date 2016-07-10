//
//  MainViewLeftNavigationBarHandler.swift
//  AFD
//
//  Created by AmirHooshang Akbarzade on 7/10/16.
//  Copyright © 2016 Akbarzade. All rights reserved.
//

import Foundation
import UIKit

extension MainViewController{
  ///leftNavigationBarICAOButton
  @IBAction func leftNavigationBarICAOButton(sender: UIButton){
    LogHandler.Log()
    
    let TVC = self.storyboard!.instantiateViewControllerWithIdentifier("airportsTabBarViewController") as! AirportsTabBarViewController
    
    TVC.modalPresentationStyle = .Popover
    
    if let AirportPopOverPresentationController = TVC.popoverPresentationController{
      AirportPopOverPresentationController.sourceView = sender
      
      AirportPopOverPresentationController.sourceRect = CGRectMake(60,25, 0, 0)
      AirportPopOverPresentationController.permittedArrowDirections = .Left
      AirportPopOverPresentationController.delegate = self
    }
    presentViewController(TVC, animated: true, completion: nil)
    
  }
  ///leftNavigationBarREFButton
  @IBAction func leftNavigationBarREFButton(sender: UIButton) {
    LogHandler.Log()
  }
  ///leftNavigationBarSTARButton
  @IBAction func leftNavigationBarSTARButton(sender: UIButton) {
    LogHandler.Log()
  }
  
  ///leftNavigationBarAPPButton
  @IBAction func leftNavigationBarAPPButton(sender: UIButton) {
    LogHandler.Log()
  }
  ///leftNavigationBarTAXIButton
  @IBAction func leftNavigationBarTAXIButton(sender: UIButton) {
    LogHandler.Log()
  }
  ///leftNavigationBarSIDButton
  @IBAction func leftNavigationBarSIDButton(sender: UIButton) {
    LogHandler.Log()
  }
  
  ///leftNavigationBarWxButton
  @IBAction func leftNavigationBarWxButton(sender: UIButton) {
    LogHandler.Log()
  }
}