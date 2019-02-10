//
//  Bindable.swift
//  SmallCaseTest
//
//  Created by Uber - Abdul on 08/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import Foundation
class Bindable<T> {
    typealias Listener = ((T) -> Void)
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        self.value = v
    }
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
}
