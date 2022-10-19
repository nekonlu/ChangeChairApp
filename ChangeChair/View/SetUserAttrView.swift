//
//  SetUserAttr.swift
//  ChangeChair
//
//  Created by nekonlu on 2022/10/18.
//  
//

import SwiftUI

struct SetUserAttrView: View {
    
    @State var totalNum: Int
    
    var body: some View {
        List {
            ForEach(1 ..< totalNum + 1) { user in
                VStack(alignment: .leading) {
                    NavigationLink(destination: SetUserAttrDetailView(userID: user)) {
                        Text("UserID: \(user)")
                    }
                }
            }
        }
        .navigationTitle("Set User Attribution")
    }
}

struct SetUserAttrView_Previews: PreviewProvider {
    static var previews: some View {
        SetUserAttrView(totalNum: 4 * 5)
    }
}
