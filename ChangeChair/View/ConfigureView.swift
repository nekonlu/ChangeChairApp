//
//  ConfigureView.swift
//  ChangeChair
//
//  Created by nekonlu on 2022/10/03.
//

import SwiftUI

struct ConfigureView: View {
    
    @State var vertical: String = ""
    @State var horizontal: String = ""
    @State var isShow: Bool = false
    @ObservedObject var setChairLayout = SetChairLayout()
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(key: "userID", ascending: true)]
    ) var usersAttr: FetchedResults<UsersAttr>
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    Text("Chair layout")
                        .font(.title2)
                        .fontWeight(.bold)
                    HStack {
                        TextField("Vertical", text: $vertical)
                        Image(systemName: "multiply")
                        TextField("Horizontal", text: $horizontal)
                    }
                    
                }
                .padding()
                
                // TODO: 必要事項を全て入力したらボタンが出現するようにする
                Button {
                    setSafety()
                } label: {
                    Text("Done")
                }
                .fullScreenCover(isPresented: $isShow) {
                    ChangedChairView(
                        setChairLayout: setChairLayout,
                        userNum: usersAttr.count)
                }
                
                // TODO: chairNumをFixしろ
                NavigationLink(destination: UsersAttrList(chairNum: toInt(vertical) * toInt(horizontal))) {
                    Text("Users Attr List")
                }
                
                
            }
            .navigationTitle("Random Chair")
        }
    }
    
    func setSafety() {
        
        guard let v = Int(vertical), let h = Int(horizontal) else {
            self.isShow = false
            return
        }
        
        guard v > 0 && h > 0 else {
            return
        }
        
        self.isShow.toggle()
        
        setChairLayout.pushedConfirmButton(
            numVertical: v,
            numHorizontal: h)
    }
    
    func toInt(_ str: String) -> Int {
        guard let numInt = Int(str) else {
            return 0
        }
        return numInt
    }
    
}

struct ConfigureView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigureView()
    }
}
