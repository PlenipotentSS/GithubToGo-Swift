//
//  Repo.swift
//  GithubToGo
//
//  Created by Stevenson on 6/6/14.
//  Copyright (c) 2014 Steven Stevenson. All rights reserved.
//
import CoreData
import UIKit

class Repo: NSManagedObject {
    @NSManaged var title: String?
    @NSManaged var urlString: String?
}
