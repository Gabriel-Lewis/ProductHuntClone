//
//  ProductCell.swift
//  ph-test1
//
//  Created by Gabriel Benbow on 1/23/16.
//  Copyright © 2016 Gabriel Benbow. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ProductCell: UITableViewCell {

	@IBOutlet weak var title: UILabel!
	@IBOutlet weak var tagline: UILabel!
	@IBOutlet weak var productImg: UIImageView!
	
	var request: Request?
	
	var _post: Post!
	
	var post: Post? {
		return _post
	}
	
	
	
	

	
	func setupCell(post: Post, img: UIImage?) {
		self._post = post
	
		title.text = post.title
		tagline.text = post.tagline
		
		if post.imageUrl != "" {
			
			if img != nil {
				
				self.productImg.image = img
				
			} else {
				
				Alamofire.request(.GET, post.imageUrl!)
					.response(completionHandler: { request, response, data, err in
					
					if err == nil {
						
						let img = UIImage(data: data!)!
						
						self.productImg.image = img
						ViewController.imageCache.setObject(img, forKey: self._post.imageUrl!)
						
					}
					
				})
			}
		} else {
			print("failed!")
			self.productImg.hidden = true
		}
		
	}
}
