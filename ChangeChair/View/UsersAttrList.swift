//
//  UsersAttrList.swift
//  ChangeChair
//
//  Created by nekonlu on 2022/10/25.
//  
//

import SwiftUI
import CoreData

struct UsersAttrList: View {
    
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(key: "userID", ascending: true)]
    ) var usersAttr: FetchedResults<UsersAttr>
    
    var body: some View {
        VStack {
            List {
                Button {
                    addUserAttr(userID: -1, studentID: 1, name: "fdsa")
                } label: {
                    Image(systemName: "plus")
                }
                ForEach(usersAttr) { user in
                    NavigationLink(destination: UpdateUserAttr()) {
                        // TODO: かっこいいボタンを作る
                        Text("\(user.userID)")
                    }
                }
            }
            

        }
        .navigationTitle("UsersAttrList")
    }
    
    func addUserAttr(userID: Int, studentID: Int, name: String) {
        let newUserAttr = UsersAttr(context: context)
        newUserAttr.userID = Int64(userID)
        newUserAttr.studentID = Int64(studentID)
        newUserAttr.name = name
        
        do {
            try context.save()
        } catch {
            fatalError()
        }
        
    }
}

struct UsersAttrList_Previews: PreviewProvider {
    static var previews: some View {
        UsersAttrList()
    }
}
