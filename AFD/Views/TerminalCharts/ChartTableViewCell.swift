//
//  ChartTableViewCell.swift
//  AFD
//
//  Created by AmirHooshang Akbarzade on 7/8/16.
//  Copyright © 2016 Akbarzade. All rights reserved.
//

import UIKit

typealias ChartViewCellDidTapButtonHandler = () -> Void

//class ChartTableViewCell: UITableViewCell {
class ChartViewCell: UITableViewCell {
    @IBOutlet weak var chartDescriptionLabel: UILabel!
    @IBOutlet weak var chartIndexLabel: UILabel!
    @IBOutlet weak var chartCheckButton: UIButton!
    
    var didTapButtonHandler: ChartViewCellDidTapButtonHandler?
    
    override func awakeFromNib() {
        LogHandler.Log()
        super.awakeFromNib()
        // Initialization code
        setupView()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
      		LogHandler.Log()
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: View Methods
    private func setupView() {
        LogHandler.Log()
        let checkedImage = UIImage(named: "ChartButtonChecked")
        let uncheckedImage = UIImage(named: "ChartButtonUncheck")
        
        chartCheckButton.setImage(uncheckedImage, forState: .Normal)
        chartCheckButton.setImage(uncheckedImage, forState: .Disabled)
        chartCheckButton.setImage(checkedImage, forState: .Selected)
        
        chartCheckButton.addTarget(self, action: #selector(ChartViewCell.didTapButton(_:)), forControlEvents: .TouchUpInside)
        
    }
    // MARK: Actions
    func didTapButton(sender: AnyObject) {
        LogHandler.Log()
        if let handler = didTapButtonHandler {
            handler()
        }
    }
}
