//
//  Highlighted.swift
//  SmallCaseTest
//
//  Created by Abdul on 09/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import Foundation
struct Highlighted : Codable {
	let value : Bool?
	let rank : Int?
	let label : String?
	let description : String?

	enum CodingKeys: String, CodingKey {

		case value = "value"
		case rank = "rank"
		case label = "label"
		case description = "description"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		value = try values.decodeIfPresent(Bool.self, forKey: .value)
		rank = try values.decodeIfPresent(Int.self, forKey: .rank)
		label = try values.decodeIfPresent(String.self, forKey: .label)
		description = try values.decodeIfPresent(String.self, forKey: .description)
	}

}
