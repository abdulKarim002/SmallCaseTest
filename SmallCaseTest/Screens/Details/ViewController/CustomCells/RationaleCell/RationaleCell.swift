//
//  RationaleCell.swift
//  SmallCaseTest
//
//  Created by Uber - Abdul on 09/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import UIKit

class RationaleCell: UITableViewCell {
    @IBOutlet weak var rationaleTxtRef: UILabel!
    
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
    
   private  func bindViewModel() {
       rationaleTxtRef.text =  viewModel?.smallCaseItemDeatils.data?.rationale?.htmlToString
    }
    
}
