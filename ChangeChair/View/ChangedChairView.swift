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
                            Text("\(tableID)")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: desplayId_ViewSize,
                                       height: desplayId_ViewSize)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                )
                            
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
            
            // Preview Only
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
            // End
        }
    }
}

struct ChangedChairView_Previews: PreviewProvider {
    static var previews: some View {
        ChangedChairView(setChairLayout: SetChairLayout())
    }
}
