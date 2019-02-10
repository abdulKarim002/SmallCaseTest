//
//  AppServerClient.swift
//  SmallCaseTest
//
//  Created by Uber - Abdul on 08/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AppServerClient {
    
    // MARK: - GetSmallCasesDeatils
    enum GetSmallCaseFailureReason: Int, Error {
        case unAuthorized = 401
        case notFound = 404
    }
    
    typealias GetSmallCaseResult = Result<CaseDetailsModel, GetSmallCaseFailureReason>
    typealias GetSmallCaseCompletion = (_ result: GetSmallCaseResult) -> Void
    
    func getSmallCaseDetails(scid: String, completion: @escaping GetSmallCaseCompletion) {
        Alamofire.request(BASE_URL+"/smallcase?scid=\(scid)")
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    do {
                        self.getHistoricalData(scid: scid, completion: { (histData) in
                            let caseDetailsdata = JSON(response.result.value)
                            let caseHistoricalData = histData
                            do {
                                // combining json to accomodate points and durations in single model
                                let combineJSON = try caseDetailsdata.merged(with: caseHistoricalData)
                                let jsonToData = try combineJSON.rawData()
                                UserDefaults.standard.set(jsonToData, forKey: scid)
                                let response = try JSONDecoder().decode(CaseDetailsModel.self, from: jsonToData)
                                completion(.success(payload: response))
                            }
                            catch {
                                print(error.localizedDescription)
                            }
                            
                        })
                    }
                case .failure(_):
                    if let statusCode = response.response?.statusCode,
                        let reason = GetSmallCaseFailureReason(rawValue: statusCode) {
                        completion(.failure(reason))
                    }
                    if isInternetAvaliable == false {
                        let storedData = UserDefaults.standard.data(forKey: scid)
                        if storedData != nil {
                            let response = try! JSONDecoder().decode(CaseDetailsModel.self, from: storedData!)
                            completion(.success(payload: response))
                        }
                        else {
                         completion(.failure(nil))
                        }
                    }
                    else {
                        completion(.failure(nil))
                    }
                    
                }
        }
        
    }
    
    
    func getHistoricalData(scid: String,  completion: @escaping (JSON) -> ()){
        Alamofire.request(BASE_URL+"/historical?scid=\(scid)").validate().responseJSON { response in
            switch response.result {
            case .success:
                completion(JSON(response.result.value ?? JSON("NULL")))
            case .failure(let error):
                print(error.localizedDescription)
                completion(JSON("NULL"))
            }
        }
    }
    
    
    //MARK:- Get ListData
    let caseIDArr:[String] = ["SCMO_0002","SCMO_0003","SCMO_0006", "SCNM_0003", "SCNM_0007", "SCNM_0008","SCNM_0009"]
    
    typealias GetListResult = Result<[CaseListModel], GetSmallCaseFailureReason>
    typealias GetListCompletion = (_ result: GetListResult) -> Void
    
    func getListData(completion: @escaping GetListCompletion) {
        var list = [CaseListModel]()
        for id in caseIDArr {
            let formatedImageUrl = formateImageUrl(scid: id, imgPx: 187)
            let caseItem = CaseListModel.init(caseid: id, imgUrl: formatedImageUrl)
            list.append(caseItem)
        }
        completion(.success(payload: list))
    }
    
    func formateImageUrl(scid: String,imgPx:Int) -> URL {
        let failsafeUrl = URL(string: "https://assets.smallcase.com/images/smallcases/187/SCNM_0003.png")
        let imageURL = "https://assets.smallcase.com/images/smallcases/\(imgPx)/\(scid).png"
        return URL(string:imageURL) ?? failsafeUrl!
    }
    
}



