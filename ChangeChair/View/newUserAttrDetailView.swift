//
//  newUserAttrDetailView.swift
//  ChangeChair
//
//  Created by nekonlu on 2022/10/19.
//  
//

import SwiftUI

struct newUserAttrDetailView: View {
    
    @Binding var beforeUserID: Int
    @State var userID: String = ""
    @State var studentID: String = ""
    @State var name: String = ""
    
    @Environment(\.managedObjectContext) private var context
    
    @FetchRequest(
        sortDescriptors: [],
        predicate: nil
    ) private var userAttr: FetchedResults<UserAttr>
    
    
    
    var body: some View {
        VStack {
            
            
            
            Text("User ID")
            TextField("default: \(userID)", text: $userID)
                .keyboardType(.numberPad)
            
            Text("Student ID")
            TextField("default: \(userID)", text: $studentID)
                .keyboardType(.numberPad)
            
            Text("Name")
            TextField("Student Name", text: $name)
            
            Button {
                saveUserAttr(studentID: studentID, name: name)
            } label: {
                Text("Save")
            }
        }
        .navigationTitle("UserID: \(userID)")
        
    }
    
    func saveUserAttr(studentID: String, name: String) {
        if(isExistUserAttr(userAttr: userAttr)) {
            
        } else {
            let newUserAttr = UserAttr(context: context)
            
            guard let userID_Int = Int32(self.userID) else {
                
            }
            
            guard let studentID_Int = Int32(studentID) else {
                newUserAttr.studentID = Int32(self.userID)
                newUserAttr.name = self.name
                do {
                    try context.save()
                } catch {
                    fatalError("セーブに失敗しました")
                }
                return
            }
            
            newUserAttr.studentID = Int32(studentID_Int)
            newUserAttr.name = self.name
            do {
                try context.save()
            } catch {
                fatalError("セーブに失敗しました")
            }
        }
    }
    
    func isExistUserAttr(userAttr: FetchedResults<UserAttr>) -> Bool {
        for user in userAttr {
            if(user.userID == self.userID) {
                return true
            }
        }
        return false
    }
}

struct newUserAttrDetailView_Previews: PreviewProvider {
    
    @State private var recentUserID: Int = 0
    
    static var previews: some View {
        newUserAttrDetailView(beforeUserID: .constant(0))
    }
}
