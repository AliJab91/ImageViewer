//
//  PopUpViewController.swift
//  PhotoViewer
//
//  Created by Ali Jaber on 2/10/18.
//  Copyright © 2018 Ali Jaber. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var closeBtn: UIButton!
    var timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.closeBtn.isHidden = true
        showAnimate()
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(showCloseBtn), userInfo: nil, repeats: false)
    }
    
    // MARK: showBtn
    @objc func showCloseBtn()  {
        self.closeBtn.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: showAnimation
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    // MARK: hideAnimation
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0
        }, completion: {(finished : Bool) in
            if(finished)
            {
                self.willMove(toParentViewController: nil)
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
            }
        })
}
    // MARK: close popup
    @IBAction func closePopUp(_ sender: Any) {
          removeAnimate()
    }
    
}
