//
//  UIView+Extension.swift
//  SmallCaseTest
//
//  Created by Uber - Abdul on 08/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func getCellWidth() -> CGFloat {
        let ViewWidth = UIScreen.main.bounds.width
        let cellWidth = (ViewWidth / 2) - 8
        return cellWidth
    }
    
    func getCellHeight() -> CGFloat {
        let ViewWidth = UIScreen.main.bounds.width
        let cellHeight = ViewWidth - 125
        return cellHeight
    }
}
