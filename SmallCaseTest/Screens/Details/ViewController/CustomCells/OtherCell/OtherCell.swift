//
//  OtherCell.swift
//  SmallCaseTest
//
//  Created by Uber - Abdul on 09/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import UIKit

class OtherCell: UITableViewCell {
    
    @IBOutlet weak var otherCellTitle: UILabel!
    @IBOutlet weak var otherCellSubTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var viewModel: CaseDetailsCellVM? {
        didSet {
            bindViewModel()
        }
    }
    
    private func bindViewModel() {
      otherCellTitle.text = "Stats"
       let dailyReturn = viewModel?.smallCaseItemDeatils.data?.stats?.returns?.daily?.rounded(toPlaces: 3)
       let weeklyReturn = viewModel?.smallCaseItemDeatils.data?.stats?.returns?.weekly?.rounded(toPlaces: 3)
       let mothlyReturn = viewModel?.smallCaseItemDeatils.data?.stats?.returns?.monthly?.rounded(toPlaces: 3)
        let yearlyReturn = viewModel?.smallCaseItemDeatils.data?.stats?.returns?.yearly?.rounded(toPlaces: 3)
       let minInvestAmount = viewModel?.smallCaseItemDeatils.data?.stats?.minInvestAmount
        
        otherCellSubTitle.text = "Min Investment - \(String(describing: minInvestAmount!)).\nDaily Returns - \(String(describing: dailyReturn!)).\nWeekly Returns - \(String(describing: weeklyReturn!)).\nMonthly Returns - \(String(describing: mothlyReturn!)).\nYearly Returns - \(String(describing: yearlyReturn!))."
        
        
    }
    
}
