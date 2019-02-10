//
//  CaseDetailsVM.swift
//  SmallCaseTest
//
//  Created by Uber - Abdul on 09/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import Foundation
class CaseDetailsVM {
        
        enum CaseDeatilsViewCellType {
            case normal(cellViewModel: CaseDetailsCellVM)
            case error(message: String)
            case empty
        }
        
        var onShowError: ((_ alert: SingleButtonAlert) -> Void)?
        let showLoadingHud: Bindable = Bindable(false)
        //let caseDetailsCardCell = Bindable<YourTypeHere?>(nil)
        let caseDetailsCardCell = Bindable<CaseDeatilsViewCellType?>(nil)
        let appServerClient: AppServerClient
        
        init(appServerClient: AppServerClient = AppServerClient()) {
            self.appServerClient = appServerClient
        }
        
        func getSmallCaseList(id:String) {
            showLoadingHud.value = true
            appServerClient.getSmallCaseDetails(scid: id, completion: { [weak self] result in
                self?.showLoadingHud.value = false
                switch result {
                case .success(let data):
                    guard data.success == true else {
                        self?.caseDetailsCardCell.value = .empty
                        return
                   }
                   self?.caseDetailsCardCell.value = .normal(cellViewModel: data)
                case .failure(let error):
                  self?.caseDetailsCardCell.value = .error(message: error?.getErrorMessage() ?? "Loading failed, check network connection")
                }
            })
        }

}


fileprivate extension AppServerClient.GetSmallCaseFailureReason {
    func getErrorMessage() -> String? {
        switch self {
        case .unAuthorized:
            return "UnAuthorized"
        case .notFound:
            return "Could not complete request, please try again."
        }
    }
}
