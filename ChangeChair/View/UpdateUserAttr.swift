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
    @State var rawStudentID: String
    @State var rawName: String
    @State var isFront: Bool
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(key: "userID", ascending: true)]
    ) var usersAttr: FetchedResults<UsersAttr>
    
    var user: FetchedResults<UsersAttr>.Element
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("出席番号")
                    .font(.title2)
                    .fontWeight(.bold)
                TextField("StudentID", text: $rawStudentID)
                    .keyboardType(.numberPad)
                Text("名前")
                    .font(.title2)
                    .fontWeight(.bold)
                TextField("Name", text: $rawName)
                Toggle(isOn: $isFront) {
                    Text("前席希望")
                        .font(.title2)
                        .fontWeight(.bold)
                }
            }
            
            
            Button {
                user.studentID = Int64(setStudentID(rawStudentID))
                user.name = self.rawName
                user.isFront = isFront
                try? context.save()
                dismiss()
            } label: {
                Text("保存")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.black)
                    )
            }
            

        }
        .padding(30)
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
