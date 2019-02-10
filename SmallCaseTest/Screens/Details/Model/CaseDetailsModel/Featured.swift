//
//  Featured.swift
//  SmallCaseTest
//
//  Created by Abdul on 09/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import Foundation
struct Featured : Codable {
	let value : Bool?

	enum CodingKeys: String, CodingKey {

		case value = "value"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		value = try values.decodeIfPresent(Bool.self, forKey: .value)
	}

}
