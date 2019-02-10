//
//  Owner.swift
//  SmallCaseTest
//
//  Created by Abdul on 09/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import Foundation
struct Owner : Codable {
	let name : String?
	let userId : String?

	enum CodingKeys: String, CodingKey {

		case name = "name"
		case userId = "userId"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		userId = try values.decodeIfPresent(String.self, forKey: .userId)
	}

}
