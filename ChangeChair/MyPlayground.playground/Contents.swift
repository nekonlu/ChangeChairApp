import UIKit

class SetUserAttr {
    var userID: Int
    var studentID: Int = 0
    var name: String = ""
    
    init(userID: Int) {
        self.userID = userID
        self.studentID = userID
    }
    
    func pushedSaveButton(studentID: Int, name: String) {
        self.studentID = studentID
        self.name = name
        
        
    }
}

var setUserAttr = SetUserAttr(userID: 1)
