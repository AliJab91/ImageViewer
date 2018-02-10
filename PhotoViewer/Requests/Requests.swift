//
//  Requests.swift
//  PhotoViewer
//
//  Created by Ali Jaber on 2/9/18.
//  Copyright © 2018 Ali Jaber. All rights reserved.
//

import Foundation
import Alamofire

// MARK: API Strings
enum APIStrings {
    static let photoURL = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=33c47c47eb7d2969b19d1daeb7f38219&format=json&nojsoncallback=1&text=cats&extras=url_o"
}
// MARK: BaseAPIRequest
class APIRequest {
    fileprivate static func request (urlString: String!, parameters: Parameters?, method: HTTPMethod, headers: HTTPHeaders?, updateXsession : Bool, completion: @escaping(Bool, Error?, String?, DataResponse<Any>?) ->()) {
        Alamofire.request(urlString, method: method, parameters: parameters, headers: headers).responseJSON { (response) in
            let contentType = response.response?.allHeaderFields["X-Session"] as? String
            if (updateXsession)
            {
                UserDefaults.standard.set(contentType, forKey: "x-session")
            }
            let success = checkIfSucccess(response: response)
            if(success){
                completion(success, nil, nil, response)
            } else {
                completion(success, response.error, "Failed", nil)
            }
        }
}

    // MARK: checkIfSuccess
    fileprivate static func checkIfSucccess(response: DataResponse<Any>!) -> Bool {
        if let responseDict = response.result.value as? [String:Any] {
            print(responseDict)
            if let successStatus = responseDict["stat"] as? String {
                return successStatus == "ok"
            }else {
                return  false
            }
        }else {
            return false
        }
    }
    
    // MARK: getPhotos Requests
    static func getPhotos(completion: @escaping (Bool, String?, PhotosArray?)-> ()) {
        request(urlString: APIStrings.photoURL, parameters: [:], method: .get,headers: nil, updateXsession: false) { (success, error, errorMsg, response) in
            if success {
                guard let dataDictionary = response?.result.value as? [String: Any] else {
                    return
                }
                guard let dataDict2 = dataDictionary["photos"] as? [String:Any] else {
                    return
                }
                let photoArray = PhotosArray.init(with: dataDict2["photo"] as! [Any])
                completion(true, nil, photoArray)
            }else {
                completion(false, response?.result.error as? String, nil)
            }
        }
    }
}
