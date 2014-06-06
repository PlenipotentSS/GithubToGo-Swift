//
//  ConnectionManager.swift
//  GithubToGo
//
//  Created by Stevenson on 6/6/14.
//  Copyright (c) 2014 Steven Stevenson. All rights reserved.
//
import Foundation

class ConnectionManager {
    let GITHUB_API = "https://api.github.com/search/repositories?q="
    let downloadQueue = NSOperationQueue()
    
    class var sharedInstance:ConnectionManager {
        
        return ConnectionManagerGlobalVariable
    }
    
    func reposForSearchString(searchString: String, completion: ((result: AnyObject)-> Void)?) {
        let queryString = "\(GITHUB_API)\(searchString)&sort=stars&order=desc"
        NSLog("%@", queryString)
        let searchURL = NSURL.URLWithString(queryString)
        downloadQueue.addOperationWithBlock({
            var err: NSError?
            let searchData = NSData.dataWithContentsOfURL(searchURL, options: NSDataReadingOptions.DataReadingMappedIfSafe, error: &err)
            if (!err) {
                let resultObject : AnyObject! = NSJSONSerialization.JSONObjectWithData(searchData, options: NSJSONReadingOptions.MutableContainers, error: &err)
                if (!err) {
                    if let searchDic: Dictionary<String, AnyObject> = resultObject as? Dictionary<String, AnyObject> {
                        if let repos : AnyObject = searchDic["items"]  {
                            NSOperationQueue.mainQueue().addOperationWithBlock({
                                completion!(result: repos)
                            })
                        }
                    }
                } else {
                    NSLog("cannot serialize")
                }
            } else {
                NSLog("search Error!")
            }
        })
    }
}

let ConnectionManagerGlobalVariable = ConnectionManager()