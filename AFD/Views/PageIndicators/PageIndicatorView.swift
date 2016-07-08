//
//  PageIndicatorView.swift
//  AFD
//
//  Created by AmirHooshang Akbarzade on 7/8/16.
//  Copyright © 2016 Akbarzade. All rights reserved.
//

import UIKit

class PageIndicatorView: UIView {
    @IBOutlet weak var chartTypeLabel: UILabel!
    @IBOutlet weak var chartsPageIndicator: UIPageControl!
    /*
     // Only override drawRect: if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func drawRect(rect: CGRect) {
     // Drawing code
     }
     */
    override func awakeFromNib() {
        LogHandler.Log()
        super.awakeFromNib()
        // Initialization code
        //		setupView()
    }
    // MARK: -
    // MARK: View Methods
    private func setupView() {
        LogHandler.Log()
    }
    
}
