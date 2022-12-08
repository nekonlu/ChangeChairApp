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
                Text(getComma(Int(usersAttr[tableID - 1].studentID)))
                    .fontWeight(.bold)
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
    
    func getComma(_ num: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ""
        formatter.groupingSize = 3
        let number = "\(formatter.string(from: NSNumber(value: num)) ?? "")"
        
        return number
    }
}

struct ChairUI_Previews: PreviewProvider {
    static var previews: some View {
        ChairUI(tableID: 2, userNum: 3)
    }
}
