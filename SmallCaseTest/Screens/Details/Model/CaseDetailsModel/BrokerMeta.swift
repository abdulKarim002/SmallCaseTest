//
//  BrokerMeta.swift
//  SmallCaseTest
//
//  Created by Abdul on 09/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import Foundation
struct BrokerMeta : Codable {
	let broker : String?
	let date : String?
	let flags : Flags?
	let status : String?

	enum CodingKeys: String, CodingKey {

		case broker = "broker"
		case date = "date"
		case flags = "flags"
		case status = "status"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		broker = try values.decodeIfPresent(String.self, forKey: .broker)
		date = try values.decodeIfPresent(String.self, forKey: .date)
		flags = try values.decodeIfPresent(Flags.self, forKey: .flags)
		status = try values.decodeIfPresent(String.self, forKey: .status)
	}

}
