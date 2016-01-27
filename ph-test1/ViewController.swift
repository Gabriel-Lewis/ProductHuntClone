//
//  ViewController.swift
//  ph-test1
//
//  Created by Gabriel Benbow on 1/21/16.
//  Copyright © 2016 Gabriel Benbow. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	@IBOutlet weak var tv: UITableView!
	
	var posts = [Post]()
	static var imageCache = NSCache()
	

	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		
		
		DataManager.getTopAppsDataFromPHWithSuccess { (PHData) -> Void in
			
			let json = JSON(data: PHData)
			
			if let postsArray = json["posts"].array {
				for postDict in postsArray {
					let name: String? = postDict["name"].string
					let tagline: String? = postDict["tagline"].string
					let imageurl: String? = postDict["thumbnail"]["image_url"].string
					
					let post = Post(title: name!, tagline: tagline!, imageUrl: imageurl!)
					
					self.posts.append(post)
					
				}
				self.tv.reloadData()
			}
			
			print(self.posts[1].imageUrl!)
			
		
		
	
		}
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		 let post = posts[indexPath.row]
		
		if let cell = tv.dequeueReusableCellWithIdentifier("ProductCell", forIndexPath: indexPath) as? ProductCell {
			
			cell.request?.cancel()
			
			var img: UIImage?
			
			if let url = post.imageUrl {
				img = ViewController.imageCache.objectForKey(url) as? UIImage
			}
			
			cell.setupCell(post, img: img)
			return cell
			
		} else {
			
			return ProductCell()
		}
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return posts.count
	}
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	
	func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
		
		performSegueWithIdentifier("ShowPosts", sender: Int(indexPath.row))
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == "ShowPosts" {
			
			let ProductVC = segue.destinationViewController as! ProductViewController
			let indexpath = tv.self.indexPathForSelectedRow
			ProductVC.x = (indexpath?.row)
		}
	}
	
	
	
}


