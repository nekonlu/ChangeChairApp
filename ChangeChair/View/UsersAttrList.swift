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
    @State var isShowingAddUserAttrView = false
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(key: "userID", ascending: true)]
    ) var usersAttr: FetchedResults<UsersAttr>
    
    var body: some View {
        VStack {
            List {
                // to AddUserAttr View
                Button {
                    self.isShowingAddUserAttrView.toggle()
                    print(createID())
                } label: {
                    Text("ユーザー属性を追加する")
                }
                .sheet(isPresented: $isShowingAddUserAttrView) {
                    AddUserAttr()
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
    
    func createID() -> Int {
        var ID_list: [Int] = []
        for user in usersAttr {
            ID_list.append(Int(user.userID))
        }
        let nextID: Int = ID_list.count
        guard nextID <= chairNum else {
            return -1
        }
        return nextID
    }
    
}

struct UsersAttrList_Previews: PreviewProvider {
    static var previews: some View {
        UsersAttrList(chairNum: 4 * 5)
    }
}
