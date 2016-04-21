//
//  dataManager.swift
//  ph-test1
//
//  Created by Gabriel Benbow on 1/23/16.
//  Copyright © 2016 Gabriel Benbow. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

let BASE_URL = "https://api.producthunt.com/v1/posts"
let POSTS = "posts"

let headers = [
	
	"Authorization": "Bearer dcdd1d60db8257bd8f65371e92911b5a2e5fd09479017d7f1042bde683934796",
	"Content-Type": "application/json",
	"Accept": "application/json",
	"Host": "api.producthunt.com"
]


class DataManager {
	
	class func getTopAppsDataFromPHWithSuccess(success: ((PHData: NSData!) -> Void)) {
		
		loadDataFromURL(BASE_URL) { (data, error) -> Void in
			
			if let urlData = data {
				
				success(PHData: urlData)
			}
		}
	}

	class func loadDataFromURL(Url: String, completion:(data: NSData?, error: NSError?) -> Void) {
		
		Alamofire.request(.GET, Url, headers: headers)
			.response { request, response, data, error in
				
				if let responseError = error {
					completion(data: nil, error: responseError)
			
				} else if response!.statusCode != 200 {
					completion(data: nil, error: error)
			
				} else {
					completion(data: data, error: nil)
			}
		}
	}		
}
