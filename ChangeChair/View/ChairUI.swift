//
//  ChairUI.swift
//  ChangeChair
//
//  Created by nekonlu on 2022/11/06.
//  
//

import SwiftUI

struct ChairUI: View {
    
    @State var tableID: Int
    @State var userNum: Int
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(key: "userID", ascending: true)]
    ) var usersAttr: FetchedResults<UsersAttr>
    
    var body: some View {
        if(tableID <= userNum) {
            VStack {
                Text("\(usersAttr[tableID - 1].studentID)")
                Text(usersAttr[tableID - 1].name!)
            }
            .font(.caption)
            .foregroundColor(.white)
            .frame(width: 45,
                   height: 45)
            .background(
                RoundedRectangle(cornerRadius: 10)
            )
        } else {
            VStack {
                Text("null")
                    
            }
            .font(.caption)
            .foregroundColor(.white)
            .frame(width: 45,
                   height: 45)
            .background(
                RoundedRectangle(cornerRadius: 10)
            )
        }
    }
}

struct ChairUI_Previews: PreviewProvider {
    static var previews: some View {
        ChairUI(tableID: 2, userNum: 3)
    }
}
