//
//  OperatingPageViewController.swift
//  PhotoViewer
//
//  Created by Ali Jaber on 2/9/18.
//  Copyright © 2018 Ali Jaber. All rights reserved.
//

import UIKit

class OperatingPageViewController: UIViewController {

    @IBOutlet weak var pageView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// MARK: goToLandingView
    func goToLandingView()   {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: "homepage")
        self.present(homeVC, animated: true, completion: nil)
    }
   
    @IBAction func skipPresser(_ sender: Any) {
        goToLandingView()
    }
    
    

}
