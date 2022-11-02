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
                
                // TODO: chairNumをFixしろ
                NavigationLink(destination: UsersAttrList(chairNum: 4 * 5)) {
                    Text("Users Attr List")
                }
                
                // TODO: 必要事項を全て入力したらボタンが出現するようにする
                Button {
                    setChairLayout.pushedConfirmButton(
                        numVertical: Int(vertical)!,
                        numHorizontal: Int(horizontal)!)
                    self.isShow.toggle()
                } label: {
                    Text("Done")
                }
                .fullScreenCover(isPresented: $isShow) {
                    ChangedChairView(setChairLayout: setChairLayout)
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
    
}

struct ConfigureView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigureView()
    }
}
