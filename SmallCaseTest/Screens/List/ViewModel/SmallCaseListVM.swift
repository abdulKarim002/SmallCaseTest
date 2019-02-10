//
//  SmallCaseListVM.swift
//  SmallCaseTest
//
//  Created by Uber - Abdul on 08/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import Foundation
class SmallCaseListVM {
    
    enum SmallCaseViewCellType {
        case normal(cellViewModel: CaseCardCellVM)
        case error(message: String)
        case empty
    }
    
    var onShowError: ((_ alert: SingleButtonAlert) -> Void)?
    let showLoadingHud: Bindable = Bindable(false)
    
    let caseCardCells = Bindable([SmallCaseViewCellType]())
    let appServerClient: AppServerClient
    
    init(appServerClient: AppServerClient = AppServerClient()) {
        self.appServerClient = appServerClient
    }
    
    func getListImages() {
        appServerClient.getListData(completion: { [weak self] result in
            self?.showLoadingHud.value = false
            switch result {
            case .success(let data):
                guard data.count > 0 else {
                    self?.caseCardCells.value = [.empty]
                    return
                }
                self?.caseCardCells.value = data.compactMap { .normal(cellViewModel: $0 as CaseCardCellVM)}
                
            case .failure(let error):
                self?.caseCardCells.value = [.error(message: error?.getErrorMessage() ?? "Loading failed, check network connection")]
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
