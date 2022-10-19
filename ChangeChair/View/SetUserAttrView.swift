//
//  SetUserAttr.swift
//  ChangeChair
//
//  Created by nekonlu on 2022/10/18.
//  
//

import SwiftUI

struct SetUserAttrView: View {
    
    @State var totalNum: Int
    @State var recentUserID: Int = 0
    
    @Environment(\.managedObjectContext) private var context
    @FetchRequest(
        sortDescriptors: [],
        predicate: nil
    ) private var userAttr: FetchedResults<UserAttr>
    
    var body: some View {
        List {
            NavigationLink(
                destination: newUserAttrDetailView(beforeUserID: $recentUserID)) {
                Image(systemName: "plus")
            }
            ForEach(self.userAttr) { user in
                NavigationLink(destination: SetUserAttrDetailView(userID: Int(user.userID))) {
                    VStack(alignment: .leading) {
                        Text("User ID : \(user.userID)")
                        Text("StudentID : \(user.studentID)")
                        Text("Name : ") + Text(user.name!)
                    }
                }
                
            }
        }
        .navigationTitle("Set User Attribution")
    }
}

struct SetUserAttrView_Previews: PreviewProvider {
    static var previews: some View {
        SetUserAttrView(totalNum: 4 * 5)
    }
}
