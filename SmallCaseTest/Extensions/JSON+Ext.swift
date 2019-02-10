//
//  JSON+Ext.swift
//  SmallCaseTest
//
//  Created by Uber - Abdul on 09/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import Foundation
import SwiftyJSON

extension JSON {
    mutating func merge(other: JSON) {
        for (key, subJson) in other {
            self[key] = subJson
        }
    }
    
    func merged(other: JSON) -> JSON {
        var merged = self
        merged.merge(other: other)
        return merged
    }
}
