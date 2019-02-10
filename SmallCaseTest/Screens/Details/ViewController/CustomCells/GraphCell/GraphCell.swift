//
//  GraphCell.swift
//  SmallCaseTest
//
//  Created by Uber - Abdul on 09/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import UIKit
import SwiftChart

class GraphCell: UITableViewCell {
    @IBOutlet weak var graphView: Chart!
    
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
        if viewModel?.smallCaseItemDeatils.data?.points == nil {
            return
        }
        
        var pointArr = [Double]()
        for point in (viewModel?.smallCaseItemDeatils.data?.points)! {
            if point.index != nil {
              pointArr.append(point.index!)
            }
        }
        
        let series = ChartSeries(pointArr)
        graphView.add(series)

    }
    
}
