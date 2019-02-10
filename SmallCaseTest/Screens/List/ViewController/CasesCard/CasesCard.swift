//
//  ShortcutCard.swift
//  Aware
//
//  Created by Uber - Abdul on 08/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import UIKit
import Kingfisher

// this card can be used on multiple as
// course card, shortcard card, singles card etc

class CasesCard: UICollectionViewCell {
    @IBOutlet weak var view_bg: UIView!
    @IBOutlet weak var image_bg: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCellUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }

    var viewModel: CaseCardCellVM? {
        didSet {
            bindViewModel()
        }
    }
    
    private func bindViewModel() {
        title?.text = viewModel?.smallCaseItem.caseid
        subtitle.text = "SmallCase"
        let url = viewModel?.smallCaseItem.imgUrl
        let processor = RoundCornerImageProcessor(cornerRadius: CONER_RADIUS)
        image_bg.kf.indicatorType = .activity
        image_bg.kf.setImage(
            with: url,
            placeholder: UIImage(named: "ic_placeholder"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
    
    private func setupCellUI() {
      view_bg.layer.cornerRadius = CONER_RADIUS
    }
    
    
}
