//
//  SetUserAttrDetailView.swift
//  ChangeChair
//
//  Created by nekonlu on 2022/10/18.
//  
//

import SwiftUI

struct SetUserAttrDetailView: View {
    
    @Environment(\.managedObjectContext) private var context
    @Environment(\.presentationMode) var presentationMode
    
//    @FetchRequest(
//        entity: UserAttr.entity(),
//        sortDescriptors: [NSSortDescriptor(keyPath: \UserAttr.userID, ascending: true)]
//    ) private var userAttr: FetchedResults<UserAttr>
    
    
    @State var userID: Int
    @State var studentID: String = ""
    @State var name: String = ""
    
    var body: some View {
        VStack {
            
            
            
            Text("\(userID)")
            
            Text("Student ID")
            TextField("default: \(userID)", text: $studentID)
                .keyboardType(.numberPad)
            
            Text("Name")
            TextField("Student Name", text: $name)
            
            Button {
                let newUserAttr = UserAttr(context: context)
                newUserAttr.id = UUID()
                newUserAttr.userID = Int32(userID)
                newUserAttr.studentID = Int32(studentID)!
                newUserAttr.name = name
                
                try? context.save()
                
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Save")
            }
        }
        .navigationTitle("UserID: \(userID)")
        
    }
}

struct SetUserAttrDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SetUserAttrDetailView(userID: 1)
    }
}
