//
//  UpdateUserAttr.swift
//  ChangeChair
//
//  Created by nekonlu on 2022/10/25.
//  
//

import SwiftUI

// プレビューでViewを表示させたい時はuserをusersAttr[0]に置換
// var user: FetchedResults<UsersAttr>.Elementをコメントアウトする
// PreviewProviderを解禁する

// 実行させたいときはusersAttr[0]をuserに置換
// var user: FetchedResults<UsersAttr>.Elementを解禁する
// PreviewProviderをコメントアウトする

struct UpdateUserAttr: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.dismiss) var dismiss
    @State var rawStudentID: String = ""
    @State var rawName: String = ""
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(key: "userID", ascending: true)]
    ) var usersAttr: FetchedResults<UsersAttr>
    
    var user: FetchedResults<UsersAttr>.Element
    
    var body: some View {
        VStack {
            TextField("StudentID", text: $rawStudentID)
            TextField("Name", text: $rawName)
            
            Button {
                user.studentID = Int64(setStudentID(rawStudentID))
                user.name = self.rawName
                try? context.save()
                dismiss()
            } label: {
                Text("保存")
            }
            

        }
    }
    
    func setStudentID(_ str: String) -> Int {
        guard let numInt = Int(str) else {
            return Int(user.userID + 1)
        }
        return numInt
    }
}

//struct UpdateUserAttr_Previews: PreviewProvider {
//    static var previews: some View {
//        UpdateUserAttr()
//    }
//}
