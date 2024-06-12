//
//  CoreDataStack.swift
//  App601
//
//  Created by IGOR on 05/06/2024.
//

import SwiftUI
import CoreData

class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    private let modelName: String = "CoreModel"
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: modelName)
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
    }()
    
    func saveContext() {
        
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            
            do {
                
                try context.save()
                
            } catch {
                
                let nserror = error as NSError
                
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func deleteAllData() {
        let context = persistentContainer.viewContext
        let entities = persistentContainer.managedObjectModel.entities
        
        for entity in entities {
            if let entityName = entity.name {
                let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entityName)
                
                do {
                    let objects = try context.fetch(fetchRequest) as? [NSManagedObject]
                    objects?.forEach { context.delete($0) }
                    
                    try context.save()
                } catch let error {
                    print("Error deleting \(entityName): \(error)")
                }
            }
        }
    }

    func deleteHistory(withHisType name: String, completion: @escaping () -> Void) {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<HistoryModel> = HistoryModel.fetchRequest()

        fetchRequest.predicate = NSPredicate(format: "hisType == %@", name)

        do {
            let objects = try context.fetch(fetchRequest)

            for object in objects {
                context.delete(object)
            }

            CoreDataStack.shared.saveContext()

            completion()

        } catch {
            print("Error fetching: \(error)")
        }
    }
    
//    func deleteStudent(withStName name: String, completion: @escaping () -> Void) {
//
//        let context = CoreDataStack.shared.persistentContainer.viewContext
//        let fetchRequest: NSFetchRequest<StudentModel> = StudentModel.fetchRequest()
//
//        fetchRequest.predicate = NSPredicate(format: "stName == %@", name)
//
//        do {
//            let objects = try context.fetch(fetchRequest)
//
//            for object in objects {
//                context.delete(object)
//            }
//
//            CoreDataStack.shared.saveContext()
//
//            completion()
//
//        } catch {
//            print("Error fetching: \(error)")
//        }
//    }

}
