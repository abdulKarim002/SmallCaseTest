//
//  NotificationViewQueue.swift
//  SmallCaseTest
//
//  Created by Abdul on 09/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import Foundation
import UIKit

open class NotificationViewQueue {
    
    public init() {}
    
    private var views = [NotificationView]()
    
    func add(_ view:NotificationView) {
        views.append(view)
    }
    
    func remove(_ view:NotificationView) {
        guard let index = (views.index { $0 == view }) else { return }
        views.remove(at: index)
    }
    
    func find(_ contentView:UIView.Type) -> NotificationView? {
        return self.findAll(contentView)?.last
    }
    
    func findAll(_ contentView:UIView.Type) -> [NotificationView]? {
        return views.filter {
            guard let content = $0.contentView else { return false }
            return type(of:content) == contentView
        }
    }
}
