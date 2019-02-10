//
//  Info.swift
//  SmallCaseTest
//
//  Created by Abdul on 09/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import Foundation
struct Info : Codable {
	let creator : String?
	let owner : Owner?
	let tags : [String]?
	let tier : String?
	let type : String?
	let name : String?
	let shortDescription : String?
	let created : String?
	let updated : String?
	let nextUpdate : String?
	let blogURL : String?
	let uploaded : String?
	let rebalanceSchedule : String?
	let publisher : String?
	let lastRebalanced : String?
	let publisherName : String?

	enum CodingKeys: String, CodingKey {

		case creator = "creator"
		case owner = "owner"
		case tags = "tags"
		case tier = "tier"
		case type = "type"
		case name = "name"
		case shortDescription = "shortDescription"
		case created = "created"
		case updated = "updated"
		case nextUpdate = "nextUpdate"
		case blogURL = "blogURL"
		case uploaded = "uploaded"
		case rebalanceSchedule = "rebalanceSchedule"
		case publisher = "publisher"
		case lastRebalanced = "lastRebalanced"
		case publisherName = "publisherName"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		creator = try values.decodeIfPresent(String.self, forKey: .creator)
		owner = try values.decodeIfPresent(Owner.self, forKey: .owner)
		tags = try values.decodeIfPresent([String].self, forKey: .tags)
		tier = try values.decodeIfPresent(String.self, forKey: .tier)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		shortDescription = try values.decodeIfPresent(String.self, forKey: .shortDescription)
		created = try values.decodeIfPresent(String.self, forKey: .created)
		updated = try values.decodeIfPresent(String.self, forKey: .updated)
		nextUpdate = try values.decodeIfPresent(String.self, forKey: .nextUpdate)
		blogURL = try values.decodeIfPresent(String.self, forKey: .blogURL)
		uploaded = try values.decodeIfPresent(String.self, forKey: .uploaded)
		rebalanceSchedule = try values.decodeIfPresent(String.self, forKey: .rebalanceSchedule)
		publisher = try values.decodeIfPresent(String.self, forKey: .publisher)
		lastRebalanced = try values.decodeIfPresent(String.self, forKey: .lastRebalanced)
		publisherName = try values.decodeIfPresent(String.self, forKey: .publisherName)
	}

}
