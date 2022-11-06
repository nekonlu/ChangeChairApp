//
//  UAPropaty.swift
//  ChangeChair
//
//  Created by nekonlu on 2022/11/06.
//  
//

import SwiftUI
import UIKit

class UAPropaty: ObservableObject {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(key: "userID", ascending: true)]
    ) var usersAttr: FetchedResults<UsersAttr>
    
    @Published var usersNum: Int = 0
    
    init() {
        self.usersNum = usersAttr.count
    }
}
