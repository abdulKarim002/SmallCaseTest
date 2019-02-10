//
//  SmallCaseDetails.swift
//  SmallCaseTest
//
//  Created by Uber - Abdul on 09/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import UIKit
import PKHUD

class SmallCaseDetails: UIViewController {
    @IBOutlet weak var titleTxtRef: UILabel!
    @IBOutlet weak var detailsTableView: UITableView!
    
    let caseDetailsViewModel: CaseDetailsVM = CaseDetailsVM()
    var showingCaseDetailsID:String?
    
    //xib name and cell identifier
    let headerCellID:String = "HeaderCell"
    let rationaleCellID:String = "RationaleCell"
    let graphCellID:String = "GraphCell"
    let otherCellID:String = "OtherCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setUpDataSourceDeleagte()
        bindViewModel()
        caseDetailsViewModel.getSmallCaseList(id: showingCaseDetailsID ?? "SCMO_0002")
    }
    
    private func setupUI() {
        titleTxtRef.text = showingCaseDetailsID
        if Reachability.isConnectedToNetwork(){
            isInternetAvaliable = true
        }else{
            isInternetAvaliable = false
            NotificationView.create(NotiView("No Internet Connection")).show()
        }
    }
    
    private func setUpDataSourceDeleagte() {
        detailsTableView.delegate = self
        detailsTableView.dataSource = self
        
        let headerCell = UINib(nibName: headerCellID, bundle: nil)
        detailsTableView.register(headerCell, forCellReuseIdentifier: headerCellID)
        
        let rationaleCell = UINib(nibName: rationaleCellID, bundle: nil)
        detailsTableView.register(rationaleCell, forCellReuseIdentifier: rationaleCellID)
        
        let graphCell = UINib(nibName: graphCellID, bundle: nil)
        detailsTableView.register(graphCell, forCellReuseIdentifier: graphCellID)
        
        let otherCell = UINib(nibName: otherCellID, bundle: nil)
        detailsTableView.register(otherCell, forCellReuseIdentifier: otherCellID)
        
    }
    
    private func bindViewModel() {
        caseDetailsViewModel.caseDetailsCardCell.bindAndFire() { [weak self] _ in
            self?.detailsTableView?.reloadData()
        }
        
        caseDetailsViewModel.onShowError = { [weak self] alert in
            self?.presentSingleButtonDialog(alert: alert)
        }
        
        caseDetailsViewModel.showLoadingHud.bind() { [weak self] visible in
            if let `self` = self {
                PKHUD.sharedHUD.contentView = PKHUDSystemActivityIndicatorView()
                visible ? PKHUD.sharedHUD.show(onView: self.view) : PKHUD.sharedHUD.hide()
            }
        }
    }
    
    @IBAction func handelDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

extension SmallCaseDetails : UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            //header height
            return 200
        }
        else if indexPath.section == 1 {
            //rationale height
            return UITableView.automaticDimension
        }
        else if indexPath.section == 2 {
            //graph cell
            return 250
        }
            
        else if indexPath.section == 3 {
            return UITableView.automaticDimension
        }
            
        else {
            return 45
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            switch caseDetailsViewModel.caseDetailsCardCell.value {
            case .normal(let viewModel)?:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: headerCellID, for: indexPath) as? HeaderCell else {
                    return UITableViewCell()
                }
                
                cell.viewModel = viewModel
                return cell
            case .error( _)?:
                let cell = UITableViewCell()
                cell.isUserInteractionEnabled = false
                return cell
            case .empty?:
                let cell = UITableViewCell()
                cell.isUserInteractionEnabled = false
                return cell
            case .none:
                return UITableViewCell()
            }
            
        }
        else if indexPath.section == 1 {
            switch caseDetailsViewModel.caseDetailsCardCell.value {
            case .normal(let viewModel)?:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: rationaleCellID, for: indexPath) as? RationaleCell else {
                    return UITableViewCell()
                }
                
                cell.viewModel = viewModel
                return cell
            case .error( _)?:
                let cell = UITableViewCell()
                cell.isUserInteractionEnabled = false
                return cell
            case .empty?:
                let cell = UITableViewCell()
                cell.isUserInteractionEnabled = false
                return cell
            case .none:
                print("noting")
                return UITableViewCell()
            }
        }
        else if indexPath.section == 2 {
            switch caseDetailsViewModel.caseDetailsCardCell.value {
            case .normal(let viewModel)?:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: graphCellID, for: indexPath) as? GraphCell else {
                    return UITableViewCell()
                }
                
                cell.viewModel = viewModel
                return cell
            case .error( _)?:
                let cell = UITableViewCell()
                cell.isUserInteractionEnabled = false
                return cell
            case .empty?:
                let cell = UITableViewCell()
                cell.isUserInteractionEnabled = false
                return cell
            case .none:
                print("noting")
                return UITableViewCell()
            }
        }
        else if indexPath.section == 3 {
            switch caseDetailsViewModel.caseDetailsCardCell.value {
            case .normal(let viewModel)?:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: otherCellID, for: indexPath) as? OtherCell else {
                    return UITableViewCell()
                }
                
                cell.viewModel = viewModel
                return cell
            case .error( _)?:
                let cell = UITableViewCell()
                cell.isUserInteractionEnabled = false
                return cell
            case .empty?:
                let cell = UITableViewCell()
                cell.isUserInteractionEnabled = false
                return cell
            case .none:
                print("noting")
                return UITableViewCell()
            }
        }
        else {
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension SmallCaseDetails: SingleButtonDialogPresenter { }

