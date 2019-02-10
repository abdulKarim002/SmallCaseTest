//
//  CaseCardCellVM.swift
//  SmallCaseTest
//
//  Created by Uber - Abdul on 08/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import Foundation

protocol CaseCardCellVM {
    var smallCaseItem: CaseListModel { get }
}

extension CaseListModel: CaseCardCellVM {
    var smallCaseItem: CaseListModel {
        return self
    }
}
