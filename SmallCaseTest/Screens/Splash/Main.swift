//
//  ViewController.swift
//  SmallCaseTest
//
//  Created by Abdul on 07/02/19.
//  Copyright © 2019 SmallCase. All rights reserved.
//

import UIKit

class Main: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animate(withDuration: 0.5, delay: 1.0, options: .curveEaseIn, animations: {
            //
        }) { (sts) in
            self.navigateUserToList()
        }
        
    }

    func navigateUserToList() {
        let storybordName = "SmallCaseList"
        let storyboard : UIStoryboard = UIStoryboard(name: storybordName, bundle: nil)
        let destinationView = storyboard.instantiateViewController(withIdentifier: storybordName)
        present(destinationView, animated: true, completion: nil)
    }

}

