//
//  User.swift
//  GithubToGo
//
//  Created by Stevenson on 6/6/14.
//  Copyright (c) 2014 Steven Stevenson. All rights reserved.
//
import CoreData
import UIKit

class User: NSManagedObject {
    @NSManaged var name: String?
    @NSManaged var imageURLString: String?
    @NSManaged var urlString: String?
    let downloadQueue = NSOperationQueue()
    
    func downloadUserImage(url: NSURL) ->UIImage {
        let image: UIImage?
        downloadQueue.addOperationWithBlock({
            //begin downloading
            
            
        })
        
        return image!
    }
}
