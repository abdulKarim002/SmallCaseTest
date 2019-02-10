//
//  Stats.swift
//  SmallCaseTest
//
//  Created by Abdul on 09/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import Foundation
struct Stats : Codable {
	let returns : Returns?
	let indexValue : Double?
	let unadjustedIndex : Double?
	let lastCloseIndex : Double?
	let divReturns : Double?
	let minInvestAmount : Int?
	let ratios : Ratios?

	enum CodingKeys: String, CodingKey {

		case returns = "returns"
		case indexValue = "indexValue"
		case unadjustedIndex = "unadjustedIndex"
		case lastCloseIndex = "lastCloseIndex"
		case divReturns = "divReturns"
		case minInvestAmount = "minInvestAmount"
		case ratios = "ratios"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		returns = try values.decodeIfPresent(Returns.self, forKey: .returns)
		indexValue = try values.decodeIfPresent(Double.self, forKey: .indexValue)
		unadjustedIndex = try values.decodeIfPresent(Double.self, forKey: .unadjustedIndex)
		lastCloseIndex = try values.decodeIfPresent(Double.self, forKey: .lastCloseIndex)
		divReturns = try values.decodeIfPresent(Double.self, forKey: .divReturns)
		minInvestAmount = try values.decodeIfPresent(Int.self, forKey: .minInvestAmount)
		ratios = try values.decodeIfPresent(Ratios.self, forKey: .ratios)
	}

}
