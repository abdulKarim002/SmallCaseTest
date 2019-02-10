//
//  HeaderCell.swift
//  SmallCaseTest
//
//  Created by Uber - Abdul on 09/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import UIKit
import Kingfisher

class HeaderCell: UITableViewCell {
    @IBOutlet weak var headerImg: UIImageView!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var headerSubTitle: UILabel!
    @IBOutlet weak var headerShortDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var viewModel: CaseDetailsCellVM? {
        didSet {
            bindViewModel()
        }
    }
    
    private func bindViewModel() {
        let scid:String = viewModel?.smallCaseItemDeatils.data?.scid ?? "SCMO_0002"
        let imageURL = "https://assets.smallcase.com/images/smallcases/187/\(scid).png"
        let url = URL(string: imageURL)
        let processor = RoundCornerImageProcessor(cornerRadius: CONER_RADIUS)
        headerImg.kf.indicatorType = .activity
        headerImg.kf.setImage(
            with: url,
            placeholder: UIImage(named: "ic_placeholder"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        headerTitle.text = viewModel?.smallCaseItemDeatils.data?.info?.name
        headerSubTitle.text = "by - \(viewModel?.smallCaseItemDeatils.data?.info?.owner?.name ?? "Small Case HQ")"
        headerShortDescription.text = viewModel?.smallCaseItemDeatils.data?.info?.shortDescription
        
    }
    
}
