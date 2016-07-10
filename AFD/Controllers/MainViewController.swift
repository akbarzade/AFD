//
//  MainViewController.swift
//  AFD
//
//  Created by AmirHooshang Akbarzade on 7/8/16.
//  Copyright © 2016 Akbarzade. All rights reserved.
//

import UIKit

class MainViewController: UIViewController , UIPopoverPresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
  
  // MARK: - Outlets
  @IBOutlet weak var MainFrameStackView: UIStackView!

  
  
  // MARK: - Left Side Navigation Bar
  // MARK: Actions's
  
  // All the Action's for Left Side Navigation Bar are Implemented in MainViewController Extension available in MainExtensions Group MainViewLeftNavigationBarHandler
  
  // MARK: Outlet's
  
  ///leftNavigationBarCirclePointer
  @IBOutlet weak var circlePointerLabel: UILabel!
  
  ///leftNavigationBarICAOButton
  @IBOutlet weak var leftNavigationBarICAO: UIButton!
		
  ///leftNavigationBarREFButton
  @IBOutlet weak var leftNavigationBarREF: UIButton!
  
  ///leftNavigationBarSTARButton
  @IBOutlet weak var leftNavigationBarSTAR: UIButton!
  
  ///leftNavigationBarAPPButton
  @IBOutlet weak var leftNavigationBarAPP: UIButton!
  
  ///leftNavigationBarTAXIButton
  @IBOutlet weak var leftNavigationBarTAXI: UIButton!
  
  ///leftNavigationBarSIDButton
  @IBOutlet weak var leftNavigationBarSID: UIButton!
  
  ///leftNavigationBarWxButton
  @IBOutlet weak var leftNavigationBarWx: UIButton!
  
}
