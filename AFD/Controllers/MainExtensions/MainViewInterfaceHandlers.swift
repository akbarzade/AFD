//
//  MainViewInterfaceHandlers.swift
//  AFD
//
//  Created by AmirHooshang Akbarzade on 7/10/16.
//  Copyright © 2016 Akbarzade. All rights reserved.
//

import Foundation
import UIKit

extension MainViewController : UIScrollViewDelegate {
  
  override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
    LogHandler.Log()
    Manager.DeviceOrientation = fromInterfaceOrientation
  }
  
  func setupTerminalChartContentLayout(){
    guard  Manager.TerminalChartsTogglingStatus != nil else { return }
    
    if Manager.TerminalChartsTogglingStatus == true {
      terminalChartContentStackView.frame.size.width = MainAreaView.frame.size.width - 68 - 240
    } else if Manager.TerminalChartsTogglingStatus == false {
      terminalChartContentStackView.frame.size.width = MainAreaView.frame.size.width - 68
    }
    
    
  }
  
  
  func setupTerminalChartContentScrollView() {
    terminalChartContentScrollView.frame = self.view.bounds
    terminalChartContentScrollView.contentSize = terminalChartContentImageViewer.bounds.size
    
    terminalChartContentScrollView.minimumZoomScale = 1.0
    terminalChartContentScrollView.maximumZoomScale = 3.0
    terminalChartContentScrollView.delegate = self
    
  }
  
  func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
    for subview: AnyObject in terminalChartContentScrollView.subviews {
      if subview.isKindOfClass(UIImageView){
        return subview as? UIView
      }
    }
    return nil
  }

  func scrollViewDidZoom(scrollView: UIScrollView) {
    let contentImageViewerSize = terminalChartContentImageViewer.bounds.size
    let contentScrollViewSize = terminalChartContentScrollView.bounds.size
  
  let verticalPadding = contentImageViewerSize.height < contentScrollViewSize.height ?
    (contentScrollViewSize.height - contentImageViewerSize.height) / 2 : 0

    let horizontalPadding = contentImageViewerSize.width < contentScrollViewSize.width ?
    (contentScrollViewSize.width - contentImageViewerSize.width) / 2 : 0
    
    terminalChartContentScrollView.contentInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
  }
  
  func refreshInterface(chartId: String) throws {
    LogHandler.Log()
  }
  
  func handleMainChartImageView(){
    LogHandler.Log()
  }
  
  func handleMainChartImageViewSize(){
    LogHandler.Log()
  }
  
  
  func resizedImage(bounds: CGSize) -> CGSize {
    LogHandler.Log()
    let size = CGSize.init(width: CGFloat(Defaults[.DisplayedChartContentWidth]), height: CGFloat(Defaults[.DisplayedChartContentHeight]))
    
    
    var horizontalRatio: CGFloat
    let verticalRatio: CGFloat
    var ratio: CGFloat = 1
    
    if UIDeviceOrientationIsPortrait(UIDevice.currentDevice().orientation) {
      if Manager.TerminalChartsTogglingStatus != nil && Manager.TerminalChartsTogglingStatus == true {
        horizontalRatio = 450  / size.width
        verticalRatio = 900 / size.height
      } else {
        horizontalRatio = 690  / size.width
        verticalRatio = 900 / size.height
      }
      ratio = min(horizontalRatio, verticalRatio)
    } else if UIDeviceOrientationIsLandscape(UIDevice.currentDevice().orientation){
      if Manager.TerminalChartsTogglingStatus != nil && Manager.TerminalChartsTogglingStatus == true {
        horizontalRatio = bounds.width  / size.width
        verticalRatio = bounds.height / size.height
      } else {
        horizontalRatio = bounds.width  / size.width
        verticalRatio = bounds.height / size.height
      }
      ratio = min(horizontalRatio, verticalRatio)
    }
    
    
    let newSize: CGSize = CGSizeMake(size.width * ratio, size.height * ratio)
    
    return newSize
  }
  
  
  func adjustConstFullSize(adjustedView: UIImageView!, parentView: UIView!) {
    LogHandler.Log()
    
    let topConstraint = NSLayoutConstraint(item: adjustedView, attribute: .Top, relatedBy: .Equal, toItem: parentView, attribute: .Top, multiplier: 1.0, constant: 0.0)
    
    let leftConstraint = NSLayoutConstraint(item: adjustedView, attribute: .Leading,                                            relatedBy: .Equal, toItem: parentView, attribute: .Leading, multiplier: 1.0, constant: 0.0)
    
    let rightConstraint = NSLayoutConstraint(item: adjustedView, attribute: .Trailing, relatedBy: .Equal, toItem: parentView, attribute: .Trailing, multiplier: 1.0, constant: 0.0)
    
    let bottomConstraint = NSLayoutConstraint(item: adjustedView, attribute: .Bottom, relatedBy: .Equal, toItem: parentView, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
    
    parentView.addConstraints([topConstraint, leftConstraint, rightConstraint, bottomConstraint])
  }
}