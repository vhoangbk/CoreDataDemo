//
//  PersonEntity.swift
//  CoreDataDemo
//
//  Created by paraline on 6/30/16.
//  Copyright © 2016 paraline. All rights reserved.
//

//import Foundation
//import CoreData
//import UIKit
//
//class PersonEntity {
//
//    func insert(person : Person) -> Bool {
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        let managedContext = appDelegate.managedObjectContext
//        
//        let entity =  NSEntityDescription.entityForName("Person",
//                                                        inManagedObjectContext:managedContext)
//        
//        let managedObj = NSManagedObject(entity: entity!,
//                                     insertIntoManagedObjectContext: managedContext)
//        
//        managedObj.setValue(person.name, forKey: "name")
//        managedObj.setValue(person.age, forKey: "age")
//        
//        do {
//            try managedContext.save()
//        } catch let error as NSError  {
//            print("Could not save \(error), \(error.userInfo)")
//            return false;
//        }
//        return true;
//    }
//    
//    func getAll() -> [Person]{
//        var ouput = [Person]();
//        let appDelegate =
//            UIApplication.sharedApplication().delegate as! AppDelegate
//        let managedContext = appDelegate.managedObjectContext
//        
//        let fetchRequest = NSFetchRequest(entityName: "Person")
//        
//        do {
//            let results =
//                try managedContext.executeFetchRequest(fetchRequest)
//            for result in results {
//                let name = (result as! NSManagedObject).valueForKey("name") as! String;
//                let age = (result as! NSManagedObject).valueForKey("age") as! Int;
//                let person = Person(name: name, age: age);
////                person.id = (result as! NSManagedObject).objectID as Int;
//                ouput.append(person);
//            }
//            
//        } catch let error as NSError {
//            print("Could not fetch \(error), \(error.userInfo)")
//        }
//        return ouput;
//    }

//    func delete(id : Int) -> Bool {
//        
//        let appDelegate =
//            UIApplication.sharedApplication().delegate as! AppDelegate
//        let managedContext = appDelegate.managedObjectContext
//        
//        let fetchRequest = NSFetchRequest(entityName: "Person")
//        
//        do {
//            let results =
//                try managedContext.executeFetchRequest(fetchRequest)
//            let person = results[id] as! NSManagedObject
//            
//            managedContext.deleteObject(person)
//            
//        } catch let error as NSError {
//            print("Could not fetch \(error), \(error.userInfo)")
//            return false;
//        }
//        return true;
//
//    }
    
//    func update(person : Person) -> Bool {
//
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//
//        let predicate = NSPredicate(format: "id == %@", person.id)
//        
//        let fetchRequest = NSFetchRequest(entityName: "Person")
//        fetchRequest.predicate = predicate
//        
//        let managedContext = appDelegate.managedObjectContext
//        
//        do {
//            let fetchedEntities = try managedContext.executeFetchRequest(fetchRequest) as! [Person]
//            fetchedEntities.first?.name = person.name
//            fetchedEntities.first?.age = person.age
//        } catch {
//            return false;
//        }
//        
//        do {
//            try appDelegate.saveContext();
//        } catch {
//           return false
//        }
//        
//        return true;
//    }
    
  
    
//}
