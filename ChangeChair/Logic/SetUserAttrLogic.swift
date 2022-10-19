//
//  SetUserAttr.swift
//  ChangeChair
//
//  Created by nekonlu on 2022/10/18.
//  
//

import UIKit

class SetUserAttr: ObservableObject {
    @Published var userID: Int
    @Published var studentID: Int = 0
    @Published var name: String = ""
    
    init(userID: Int) {
        self.userID = userID
        self.studentID = userID
    }
    
    func pushedSaveButton(studentID: Int, name: String) {
        self.studentID = studentID
        self.name = name
        
        
    }
}


