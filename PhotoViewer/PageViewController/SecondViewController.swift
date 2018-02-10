//
//  SecondViewController.swift
//  PhotoViewer
//
//  Created by Ali Jaber on 2/10/18.
//  Copyright © 2018 Ali Jaber. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = UIImage(named: "secondView.png")
    }

  
}
