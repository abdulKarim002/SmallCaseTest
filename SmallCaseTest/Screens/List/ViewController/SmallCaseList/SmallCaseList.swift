//
//  CoursesView.swift
//  Aware
//
//  Created by Uber - Abdul on 06/01/19.
//  Copyright © 2019 Uber Health Tech Private Ltd. All rights reserved.
//

import UIKit
import PKHUD

class SmallCaseList: UIViewController {
    
    let smallCaseViewModel: SmallCaseListVM = SmallCaseListVM()

    @IBOutlet weak var caseCollectionView: UICollectionView!
    let caseCollectionCellId = "CasesCard"
    var sendingCaseID:String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setUpDataSourceDeleagte()
        bindViewModel()
        smallCaseViewModel.getListImages()
    }
    
    
    
    private func setupUI() {
        if Reachability.isConnectedToNetwork(){
            isInternetAvaliable = true
            NotificationView.create(GreenNotiView("Internet Connection Available!")).show()
        }else{
            isInternetAvaliable = false
            NotificationView.create(NotiView("No Internet Connection")).show()
        }
    }
    
   private func setUpDataSourceDeleagte() {
        caseCollectionView.delegate = self
        caseCollectionView.dataSource = self
        
        let caseCardnibCell = UINib(nibName: caseCollectionCellId, bundle: nil)
        caseCollectionView.register(caseCardnibCell, forCellWithReuseIdentifier: caseCollectionCellId)
    }
    
    func bindViewModel() {
        smallCaseViewModel.caseCardCells.bindAndFire() { [weak self] _ in
            self?.caseCollectionView?.reloadData()
        }
        
        smallCaseViewModel.onShowError = { [weak self] alert in
            self?.presentSingleButtonDialog(alert: alert)
        }
        
        
        smallCaseViewModel.showLoadingHud.bind() { [weak self] visible in
            if let `self` = self {
                PKHUD.sharedHUD.contentView = PKHUDSystemActivityIndicatorView()
                visible ? PKHUD.sharedHUD.show(onView: self.view) : PKHUD.sharedHUD.hide()
            }
        }
    }

}

extension SmallCaseList: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return smallCaseViewModel.caseCardCells.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch smallCaseViewModel.caseCardCells.value[indexPath.row] {
        case .normal(let viewModel):
            guard let cell = caseCollectionView.dequeueReusableCell(withReuseIdentifier: caseCollectionCellId, for: indexPath) as? CasesCard else {
                return UICollectionViewCell()
            }
            
            cell.viewModel = viewModel
            return cell
        case .error(let message):
            let cell = UICollectionViewCell()
            cell.isUserInteractionEnabled = false
            //cell.textLabel?.text = message
            return cell
        case .empty:
            let cell = UICollectionViewCell()
            cell.isUserInteractionEnabled = false
            //cell.textLabel?.text = "No data available"
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
       return UIEdgeInsets(top: CGFloat(0), left: CGFloat(CONER_RADIUS*2), bottom: CGFloat(0), right: CGFloat(CONER_RADIUS*2))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: view.getCellWidth() , height: view.getCellHeight())
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = caseCollectionView.cellForItem(at: indexPath) as! CasesCard
        sendingCaseID = cell.title.text!
        performSegue(withIdentifier: "caseDetailsSegue" , sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "caseDetailsSegue" {
            let dvc = segue.destination as! SmallCaseDetails
            dvc.showingCaseDetailsID = sendingCaseID
        }
    }
}


extension SmallCaseList: SingleButtonDialogPresenter { }

extension SmallCaseList {

}
