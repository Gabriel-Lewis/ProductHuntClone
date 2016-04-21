//
//  ProductViewController.swift
//  ph-test1
//
//  Created by Gabriel Benbow on 1/23/16.
//  Copyright © 2016 Gabriel Benbow. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ProductViewController: UIViewController {

	@IBOutlet weak var productImage: UIImageView!
	var posts = [Post]()
	
	var x: Int!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		//let post: Post!
		DataManager.getTopAppsDataFromPHWithSuccess { PHData in
			
			let json = JSON(data: PHData)
			
			if let postsArray = json["posts"].array {
				for postDict in postsArray {
					let name: String? = postDict["name"].string
					let tagline: String? = postDict["tagline"].string
					let imageurl: String? = postDict["thumbnail"]["image_url"].string
					
					let post = Post(title: name!, tagline: tagline!, imageUrl: imageurl!)
					self.posts.append(post)
					
				}
			}
		}
	}
}
