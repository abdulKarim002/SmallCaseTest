//
//  NotiView.swift
//  SmallCaseTest
//
//  Created by Uber - Abdul on 11/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import Foundation
import UIKit

class NotiView: UILabel, NotificationViewProtocol {
    func didHide(completed: Bool) {
        print("notiview hide." + (completed ? "finished" : "no finished"))
    }
    
    func didShow() {
        print("notiview show.")
    }
    
    public init(_ message:String) {
        var size:CGSize {
            return (message as NSString).boundingRect(with: CGSize(width: UIScreen.main.bounds.width - 30, height: .infinity),
                                                      options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                      attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15)],
                                                      context: nil).size
        }
        
        super.init(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height + 15))
        
        self.backgroundColor = .red
        self.font = UIFont.systemFont(ofSize: 15)
        self.textAlignment = .center
        self.numberOfLines = 0
        self.text = message
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class GreenNotiView : NotiView {
    override init(_ message: String) {
        super.init(message)
        self.backgroundColor = .green
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
