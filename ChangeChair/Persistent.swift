//
//  Persistent.swift
//  ChangeChair
//
//  Created by nekonlu on 2022/10/25.
//  
//

import CoreData

struct PersistenceController {
    let container: NSPersistentContainer
    
    // この構造体が呼び出されたときに実行するコード
    init() {
        // NSPersistentContainerのインスタンスを生成している
        container = NSPersistentContainer(name: "Model")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error")
            }
        })
    }
}
