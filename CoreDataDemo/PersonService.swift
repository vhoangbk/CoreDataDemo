//
//  PersonService.swift
//  CoreDataDemo
//
//  Created by paraline on 6/30/16.
//  Copyright © 2016 paraline. All rights reserved.
//

import CoreData
import UIKit

class PersonService{
    
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
    }
    
    // Creates a new Person
    func insert(name: String, age: NSNumber) -> Person {
        
        let newItem = NSEntityDescription.insertNewObjectForEntityForName(Person.entityName, inManagedObjectContext: context) as! Person
        
        newItem.name = name
        newItem.age = age
        
        saveChanges();
        
        return newItem
    }
    
    // Gets a person by id
    func getById(id: NSManagedObjectID) -> Person? {
        return context.objectWithID(id) as? Person
    }
    
    // Gets all.
    func getAll() -> [Person]{
        return get(withPredicate: NSPredicate(value:true))
    }
    
    // Gets all that fulfill the specified predicate.
    // Predicates examples:
    // - NSPredicate(format: "name == %@", "Juan Carlos")
    // - NSPredicate(format: "name contains %@", "Juan")
    func get(withPredicate queryPredicate: NSPredicate) -> [Person]{
        let fetchRequest = NSFetchRequest(entityName: Person.entityName)
        
        fetchRequest.predicate = queryPredicate
        
        do {
            let response = try context.executeFetchRequest(fetchRequest)
            return response as! [Person]
            
        } catch let error as NSError {
            // failure
            print(error)
            return [Person]()
        }
    }
    
    // Updates a person
    func update(updatedPerson: Person){
        if let person = getById(updatedPerson.objectID){
            person.name = updatedPerson.name
            person.age = updatedPerson.age
            saveChanges();
        }
    }
    
    // Deletes a person
    func delete(id: NSManagedObjectID){
        if let personToDelete = getById(id){
            context.deleteObject(personToDelete)
            saveChanges();
        }
    }
    
    // Saves all changes
    func saveChanges(){
        do{
            try context.save()
        } catch let error as NSError {
            // failure
            print(error)
        }
    }
}