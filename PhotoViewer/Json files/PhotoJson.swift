//
//  PhotoJson.swift
//  PhotoViewer
//
//  Created by Ali Jaber on 2/9/18.
//  Copyright © 2018 Ali Jaber. All rights reserved.
//

import Foundation

struct PhotosArray {
    var photosArray : Array<PhotosObject>?
    init(with json: Array <Any>) {
        var dataArray = Array<PhotosObject>()
        for data in json {
            let photo = PhotosObject.init(with: data as! Dictionary<String,Any>)
            dataArray.append(photo)
        }
        photosArray = Array<PhotosObject>.init(dataArray)
    }
}

struct PhotosObject {
    var title: String?
    var photoURL : String?
    init(with json:Dictionary<String,Any>) {
        title = json["title"] as? String
        if let value = json["url_o"] {
              photoURL = json["url_o"] as? String
        }else{
        photoURL = "" ;
        }
    }
}
