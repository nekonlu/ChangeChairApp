//
//  Persistent.swift
//  ChangeChair
//
//  Created by nekonlu on 2022/10/19.
//  
//

import CoreData

struct PersistenceController {
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "MyCoreData")
        
        // loadPersistentStores method: PersistentStoreを読み込み、作成していなければ作成する
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("UNresolved error \(error)")
            }
            
        })
    }
}
