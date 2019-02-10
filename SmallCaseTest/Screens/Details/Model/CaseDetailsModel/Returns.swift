//
//  Returns.swift
//  SmallCaseTest
//
//  Created by Abdul on 09/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import Foundation
struct Returns : Codable {
	let daily : Double?
	let weekly : Double?
	let monthly : Double?
	let yearly : Double?

	enum CodingKeys: String, CodingKey {

		case daily = "daily"
		case weekly = "weekly"
		case monthly = "monthly"
		case yearly = "yearly"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		daily = try values.decodeIfPresent(Double.self, forKey: .daily)
		weekly = try values.decodeIfPresent(Double.self, forKey: .weekly)
		monthly = try values.decodeIfPresent(Double.self, forKey: .monthly)
		yearly = try values.decodeIfPresent(Double.self, forKey: .yearly)
	}

}
