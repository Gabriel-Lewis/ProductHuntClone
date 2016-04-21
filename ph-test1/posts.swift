//
//  posts.swift
//  ph-test1
//
//  Created by Gabriel Benbow on 1/21/16.
//  Copyright © 2016 Gabriel Benbow. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
import SwiftyJSON

class Post {

	private var _title: String!
	private var _tagline: String!
	private var _imageUrl: String?
	private var _productImage: UIImageView!
	
	var title: String {
		return _title
	}
	
	var tagline: String {
		return _tagline
	}
	
	var imageUrl: String? {
		return _imageUrl
	}
	
	var productImage: UIImageView {
		return _productImage
	}
	
	init(title: String, tagline: String, imageUrl: String) {
		self._tagline = tagline
		self._title = title
		self._imageUrl = imageUrl
	}
}

				

	

