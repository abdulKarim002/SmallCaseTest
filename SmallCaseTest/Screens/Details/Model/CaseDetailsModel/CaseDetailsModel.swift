//
//  SmallCase_Base.swift
//  SmallCaseTest
//
//  Created by Abdul on 09/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import Foundation
struct CaseDetailsModel : Codable {
	let success : Bool?
	let errors : String?
	let data : Data?

	enum CodingKeys: String, CodingKey {

		case success = "success"
		case errors = "errors"
		case data = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		success = try values.decodeIfPresent(Bool.self, forKey: .success)
		errors = try values.decodeIfPresent(String.self, forKey: .errors)
		data = try values.decodeIfPresent(Data.self, forKey: .data)
	}

}
