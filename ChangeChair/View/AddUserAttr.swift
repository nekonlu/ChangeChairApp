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
    @State var rawStudentID: String = ""
    @State var rawName: String = ""
    
    var body: some View {
        VStack {
            TextField("StudentID", text: $rawStudentID)
            TextField("Name", text: $rawName)
            
            Button {
                // addUserAttr(userID: <#T##Int#>, studentID: <#T##Int#>, name: <#T##String#>)
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
}

struct AddUserAttr_Previews: PreviewProvider {
    static var previews: some View {
        AddUserAttr()
    }
}
