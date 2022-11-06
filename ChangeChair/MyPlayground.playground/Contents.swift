import SwiftUI

class UAPropaty {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(key: "userID", ascending: true)]
    ) var usersAttr: FetchedResults<UsersAttr>
    
    var usersNum: Int = 0
    
    init() {
        self.usersNum = usersAttr.count
    }
}

var UAP = UAPropaty()
UAP.usersNum
