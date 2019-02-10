//
//  Flags.swift
//  SmallCaseTest
//
//  Created by Abdul on 09/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import Foundation
struct Flags : Codable {
	let featured : Featured?
	let highlighted : Highlighted?
	let popular : Popular?

	enum CodingKeys: String, CodingKey {

		case featured = "featured"
		case highlighted = "highlighted"
		case popular = "popular"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		featured = try values.decodeIfPresent(Featured.self, forKey: .featured)
		highlighted = try values.decodeIfPresent(Highlighted.self, forKey: .highlighted)
		popular = try values.decodeIfPresent(Popular.self, forKey: .popular)
	}

}
