//
//  Ratios.swift
//  SmallCaseTest
//
//  Created by Abdul on 09/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import Foundation
struct Ratios : Codable {
	let _52wHigh : Double?
	let _52wLow : Double?
	let divYield : Double?
	let divYieldDifferential : Double?
	let largeCapPercentage : Double?
	let midCapPercentage : Double?
	let pb : Double?
	let pbDiscount : Double?
	let pe : Double?
	let peDiscount : Double?
	let ema : Double?
	let lastCloseEma : Double?
	let momentumRank : Int?
	let risk : Double?
	let smallCapPercentage : Double?
	let cagr : Double?
	let sharpe : Double?
	let momentum : Double?
	let marketCapCategory : String?

	enum CodingKeys: String, CodingKey {

		case _52wHigh = "52wHigh"
		case _52wLow = "52wLow"
		case divYield = "divYield"
		case divYieldDifferential = "divYieldDifferential"
		case largeCapPercentage = "largeCapPercentage"
		case midCapPercentage = "midCapPercentage"
		case pb = "pb"
		case pbDiscount = "pbDiscount"
		case pe = "pe"
		case peDiscount = "peDiscount"
		case ema = "ema"
		case lastCloseEma = "lastCloseEma"
		case momentumRank = "momentumRank"
		case risk = "risk"
		case smallCapPercentage = "smallCapPercentage"
		case cagr = "cagr"
		case sharpe = "sharpe"
		case momentum = "momentum"
		case marketCapCategory = "marketCapCategory"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		_52wHigh = try values.decodeIfPresent(Double.self, forKey: ._52wHigh)
		_52wLow = try values.decodeIfPresent(Double.self, forKey: ._52wLow)
		divYield = try values.decodeIfPresent(Double.self, forKey: .divYield)
		divYieldDifferential = try values.decodeIfPresent(Double.self, forKey: .divYieldDifferential)
		largeCapPercentage = try values.decodeIfPresent(Double.self, forKey: .largeCapPercentage)
		midCapPercentage = try values.decodeIfPresent(Double.self, forKey: .midCapPercentage)
		pb = try values.decodeIfPresent(Double.self, forKey: .pb)
		pbDiscount = try values.decodeIfPresent(Double.self, forKey: .pbDiscount)
		pe = try values.decodeIfPresent(Double.self, forKey: .pe)
		peDiscount = try values.decodeIfPresent(Double.self, forKey: .peDiscount)
		ema = try values.decodeIfPresent(Double.self, forKey: .ema)
		lastCloseEma = try values.decodeIfPresent(Double.self, forKey: .lastCloseEma)
		momentumRank = try values.decodeIfPresent(Int.self, forKey: .momentumRank)
		risk = try values.decodeIfPresent(Double.self, forKey: .risk)
		smallCapPercentage = try values.decodeIfPresent(Double.self, forKey: .smallCapPercentage)
		cagr = try values.decodeIfPresent(Double.self, forKey: .cagr)
		sharpe = try values.decodeIfPresent(Double.self, forKey: .sharpe)
		momentum = try values.decodeIfPresent(Double.self, forKey: .momentum)
		marketCapCategory = try values.decodeIfPresent(String.self, forKey: .marketCapCategory)
	}

}
