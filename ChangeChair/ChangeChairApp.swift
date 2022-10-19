//
//  ChangeChairApp.swift
//  ChangeChair
//
//  Created by nekonlu on 2022/10/03.
//  
//

import SwiftUI

@main
struct ChangeChairApp: App {
    
    let persistenceController = PersistenceController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
