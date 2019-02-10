//
//  Benchmark.swift
//  SmallCaseTest
//
//  Created by Abdul on 09/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import Foundation
struct Benchmark : Codable {
	let id : String?
	let message : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case message = "message"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		message = try values.decodeIfPresent(String.self, forKey: .message)
	}

}
