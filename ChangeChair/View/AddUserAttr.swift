//
//  AddUserAttr.swift
//  ChangeChair
//
//  Created by nekonlu on 2022/11/02.
//  
//

import SwiftUI

struct AddUserAttr: View {
    
    @Environment(\.managedObjectContext) var context
    @Environment(\.dismiss) var dismiss
    @State var userID: Int
    @State var rawStudentID: String = ""
    @State var rawName: String = ""
    
    var body: some View {
        VStack {
            TextField("StudentID", text: $rawStudentID)
                .keyboardType(.numberPad)
            TextField("Name", text: $rawName)
            
            Button {
                addUserAttr(
                    userID: userID,
                    studentID: setStudentID(rawStudentID),
                    name: rawName
                )
                dismiss()
            } label: {
                Text("保存")
            }
            

        }
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
    
    func setStudentID(_ str: String) -> Int {
        guard let numInt = Int(str) else {
            return userID + 1
        }
        return numInt
    }
}

struct AddUserAttr_Previews: PreviewProvider {
    static var previews: some View {
        AddUserAttr(userID: 4 * 5)
    }
}
