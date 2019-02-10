//
//  Alert.swift
//  SmallCaseTest
//
//  Created by Uber - Abdul on 08/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import Foundation

struct AlertAction {
    let buttonTitle: String
    let handler: (() -> Void)?
}

struct SingleButtonAlert {
    let title: String
    let message: String?
    let action: AlertAction
}
