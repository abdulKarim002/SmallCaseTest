//
//  Data.swift
//  SmallCaseTest
//
//  Created by Abdul on 09/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import Foundation
struct Data : Codable {
	let _id : String?
	let rationale : String?
	let scid : String?
	let segments : [String]?
	let constituents : [String]?
	let info : Info?
	let __v : Int?
	let stats : Stats?
	let flags : Flags?
	let version : Int?
	let updates : [Updates]?
	let newsTag : String?
	let brokerMeta : BrokerMeta?
	let benchmark : Benchmark?
	let relatedSmallcases : [String]?
    
    //Historical Datapoints
    let points : [Points]?
    let durations : [String]?

	enum CodingKeys: String, CodingKey {

		case _id = "_id"
		case rationale = "rationale"
		case scid = "scid"
		case segments = "segments"
		case constituents = "constituents"
		case info = "info"
		case __v = "__v"
		case stats = "stats"
		case flags = "flags"
		case version = "version"
		case updates = "updates"
		case newsTag = "newsTag"
		case brokerMeta = "brokerMeta"
		case benchmark = "benchmark"
		case relatedSmallcases = "relatedSmallcases"
        
        //Historical Datapoints
        case points = "points"
        case durations = "durations"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		_id = try values.decodeIfPresent(String.self, forKey: ._id)
		rationale = try values.decodeIfPresent(String.self, forKey: .rationale)
		scid = try values.decodeIfPresent(String.self, forKey: .scid)
		segments = try values.decodeIfPresent([String].self, forKey: .segments)
		constituents = try values.decodeIfPresent([String].self, forKey: .constituents)
		info = try values.decodeIfPresent(Info.self, forKey: .info)
		__v = try values.decodeIfPresent(Int.self, forKey: .__v)
		stats = try values.decodeIfPresent(Stats.self, forKey: .stats)
		flags = try values.decodeIfPresent(Flags.self, forKey: .flags)
		version = try values.decodeIfPresent(Int.self, forKey: .version)
		updates = try values.decodeIfPresent([Updates].self, forKey: .updates)
		newsTag = try values.decodeIfPresent(String.self, forKey: .newsTag)
		brokerMeta = try values.decodeIfPresent(BrokerMeta.self, forKey: .brokerMeta)
		benchmark = try values.decodeIfPresent(Benchmark.self, forKey: .benchmark)
		relatedSmallcases = try values.decodeIfPresent([String].self, forKey: .relatedSmallcases)
        
        //Historical data
        points = try values.decodeIfPresent([Points].self, forKey: .points)
        durations = try values.decodeIfPresent([String].self, forKey: .durations)
	}

}
