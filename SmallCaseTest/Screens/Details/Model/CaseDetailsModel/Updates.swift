//
//  Updates.swift
//  SmallCaseTest
//
//  Created by Abdul on 09/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import Foundation
struct Updates : Codable {
	let label : String?
	let rationale : String?
	let date : String?
	let version : Int?

	enum CodingKeys: String, CodingKey {

		case label = "label"
		case rationale = "rationale"
		case date = "date"
		case version = "version"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		label = try values.decodeIfPresent(String.self, forKey: .label)
		rationale = try values.decodeIfPresent(String.self, forKey: .rationale)
		date = try values.decodeIfPresent(String.self, forKey: .date)
		version = try values.decodeIfPresent(Int.self, forKey: .version)
	}

}
