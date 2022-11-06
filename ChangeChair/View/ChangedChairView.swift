//
//  ChangedChairView.swift
//  ChangeChair
//
//  Created by nekonlu on 2022/10/04.
//  
//

import SwiftUI

struct ChangedChairView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var context
    @ObservedObject var setChairLayout: SetChairLayout
    @State var userNum: Int
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(key: "userID", ascending: true)]
    ) var usersAttr: FetchedResults<UsersAttr>
    
    let desplayId_ViewSize: CGFloat = 45
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            
            
            Text("FRONT")
                .font(.caption)
                .fontWeight(.bold)
            
            ForEach(setChairLayout.chairTable, id: \.self) { tate in
                HStack {
                    ForEach(tate, id: \.self) { tableID in
                        VStack {
                            ChairUI(
                                tableID: tableID,
                                userNum: userNum)
                        }
                    }
                }
            }
            
            Text("BACK")
                .font(.caption)
                .fontWeight(.bold)
                .padding()
            
            Button {
                setChairLayout.chairTable = []
                dismiss()
            } label: {
                Text("戻る")
            }
            
            // Preview & Debug Only
            Button {
                setChairLayout.pushedConfirmButton(
                    numVertical: 6,
                    numHorizontal: 7)
            } label: {
                Text("Set")
            }
            Button {
                setChairLayout.chairTable = []
                print("\(usersAttr[20].userID)")
            } label: {
                Text("Reset")
            }
            Button {
                print(usersAttr.count)
            } label: {
                Text("usersAttr.count")
            }
            // End
        }
    }
    
    
}

struct ChangedChairView_Previews: PreviewProvider {
    static var previews: some View {
        ChangedChairView(setChairLayout: SetChairLayout(), userNum: 3)
    }
}
