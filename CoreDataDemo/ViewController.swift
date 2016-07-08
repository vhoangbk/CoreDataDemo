//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by paraline on 6/30/16.
//  Copyright © 2016 paraline. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var personService : PersonService?;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        personService = PersonService(context: context)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressInsert(sender: AnyObject) {
        for i in 1...10 {
            personService!.insert("Juan Carlos ", age: i)
        }
    }

    @IBAction func pressUpdate(sender: AnyObject) {
        
    }
    
    @IBAction func pressDelete(sender: AnyObject) {
//        let people : [Person] = personService!.getAll()
//        let firstPerson = personService!.getById(people[3].objectID)!
//        print("id \(firstPerson.objectID.URIRepresentation().absoluteString)");
        
        let str : String = "x-coredata://36D29A57-C7A9-4126-93E0-8F1BEBF03BCF/Person/p1";
        let urlID = NSURL(string: str);
        
        let objID : NSManagedObjectID = (context.persistentStoreCoordinator?.managedObjectIDForURIRepresentation(urlID!))!;
        
        personService!.delete(objID)
    }
    
    @IBAction func pressRead(sender: AnyObject) {
        let people : [Person] = personService!.getAll()
        for person in people {
            print("\(person.objectID) \(person.name!) \(person.age!)" );
        }
        
        if people.count > 0 {
            let firstPerson = personService!.getById(people[0].objectID)!
            let id = firstPerson.objectID;
            
            print("id \(id)")
        }
    }
    
}

