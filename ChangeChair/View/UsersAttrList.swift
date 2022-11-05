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
    
    @State var chairNum: Int
    @State var isShowingAddUserAttrView: Bool = false
    @State var isEnableAddButton: Bool = true
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(key: "userID", ascending: true)]
    ) var usersAttr: FetchedResults<UsersAttr>
    
    var body: some View {
        VStack {
            List {
                // to AddUserAttr View
                Button {
                    self.isShowingAddUserAttrView.toggle()
                } label: {
                    Text("ユーザー属性を追加する")
                }
                .sheet(isPresented: $isShowingAddUserAttrView) {
                    AddUserAttr(userID: createID())
                }
                .disabled(!enableButton(num: createID()))
                
                
                ForEach(usersAttr) { user in
                    NavigationLink(destination: UpdateUserAttr(user: user)) {
                        // TODO: かっこいいボタンを作る
                        Text("ID: \(user.userID), StudentID\(user.studentID), Name: " + user.name!)
                    }
                }.onDelete(perform: removeUserAttr)
            }
            

        }
        .navigationTitle("UsersAttrList")
    }
    
    func removeUserAttr(at offsets: IndexSet) {
        for index in offsets {
            let putTestCoreData = usersAttr[index]
            context.delete(putTestCoreData)
        }
        try? context.save()
        var cnt = 0
        for user in usersAttr {
            user.userID = Int64(cnt)
            cnt += 1
        }
        try? context.save()
    }
    
    func createID() -> Int {
        var ID_list: [Int] = []
        for user in usersAttr {
            ID_list.append(Int(user.userID))
        }
        let nextID: Int = ID_list.count
        guard nextID < chairNum else {
            return -1
        }
        return nextID
    }
    
    func countUsersAttr() -> Int {
        var ID_list: [Int] = []
        for user in usersAttr {
            ID_list.append(Int(user.userID))
        }
        let count: Int = ID_list.count
        return count
    }
    
    func enableButton(num: Int) -> Bool {
        if(num == -1) {
            return false
        } else {
            return true
        }
    }
}

struct UsersAttrList_Previews: PreviewProvider {
    static var previews: some View {
        UsersAttrList(chairNum: 4 * 5)
    }
}
