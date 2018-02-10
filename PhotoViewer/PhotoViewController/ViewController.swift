//
//  ViewController.swift
//  PhotoViewer
//
//  Created by Ali Jaber on 2/8/18.
//  Copyright © 2018 Ali Jaber. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: BaseViewController {
    @IBOutlet weak var imageDisplayer: UIImageView!
    @IBOutlet weak var photoTitle: UILabel!
    var timer = Timer()
    var photoArray :Array <PhotosObject>?
    var imagesURL = Array<String>()
    var imagesTitles = Array<String>()
    var counter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        popUp()
        self.imageDisplayer.image = UIImage(named: "firstView")
        getPhotos()
    }
    
    // MARK: popUp ViewController
    
    func popUp()  {
        let popvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUp") as! PopUpViewController
        self.addChildViewController(popvc)
        popvc.view.frame = self.view.frame
        self.view.addSubview(popvc.view)
        popvc.didMove(toParentViewController: self)
    }
    
    // MARK: get images Request
    func getPhotos()  {
        self.showLoader()
        APIRequest.getPhotos { (success, error, AllPhotos) in
            self.hideLoader()
            if(success){
                print(AllPhotos?.photosArray?.count as Any)
                self.photoArray = AllPhotos?.photosArray
                self.getImages()
            }else {
                self.showAlert(title: "error", message: "please try again")
                
            }
        }
    }
    
    // MARK: get imagesURL
    func getImages()  { // since some json data dont have image url, so we did this function
        for photo: PhotosObject in self.photoArray! {
            if(photo.photoURL == ""){
            }else {
                imagesURL.append(photo.photoURL!)
                imagesTitles.append(photo.title!)
            }
        }
        fireTimer()
    }
    
    // MARK: fire timer
    func fireTimer()  {
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(setImagesInImageView), userInfo: nil, repeats: true)
    }
    
    // MARK: setting images in view
    @objc func setImagesInImageView()  {
        if(counter == 5){
            counter = 0
        }
        if let url = URL(string: self.imagesURL[counter] ){
            self.imageDisplayer.kf.setImage(with: url)
        }
        else{
            return
        }
         self.photoTitle.text = self.imagesTitles[counter]
          counter = counter + 1
          showLabel()
          imageDisplayer.center = CGPoint(x: imageDisplayer.center.x - 500, y: imageDisplayer.center.y)
          UIView.animate(withDuration: 2) {
          self.imageDisplayer.center = CGPoint(x: self.imageDisplayer.center.x + 500, y: self.imageDisplayer.center.y)
        }
    }
    
    // MARK: hide label
    func hideItems()  {
         photoTitle.isHidden = true
       
    }
    
// MARK: show label
    func showLabel()  {
        photoTitle.isHidden = false
    }
   
}

