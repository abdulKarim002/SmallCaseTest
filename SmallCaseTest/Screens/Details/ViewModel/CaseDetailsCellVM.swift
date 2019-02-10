//
//  CaseDetailsCellVM.swift
//  SmallCaseTest
//
//  Created by Uber - Abdul on 09/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import Foundation

protocol CaseDetailsCellVM {
    var smallCaseItemDeatils: CaseDetailsModel { get }
}

extension CaseDetailsModel: CaseDetailsCellVM {
    var smallCaseItemDeatils: CaseDetailsModel {
        return self
    }
}
