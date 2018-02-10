//
//  BaseViewController.swift
//  PhotoViewer
//
//  Created by Ali Jaber on 2/9/18.
//  Copyright © 2018 Ali Jaber. All rights reserved.
//

import UIKit
import SVProgressHUD
class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: showloader
    func showLoader()  {
        SVProgressHUD.show()
    }
    
    // MARK: hideLoader
    func hideLoader()  {
        SVProgressHUD.dismiss()
    }
    
    // MARK: show alert
    func showAlert(title: String, message: String)  {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismissBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(dismissBtn)
        self.present(alert, animated: true, completion: nil)
    }
    

}
