//
//  Person+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by paraline on 6/30/16.
//  Copyright © 2016 paraline. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Person {

    @NSManaged var name: String?
    @NSManaged var age: NSNumber?

}
