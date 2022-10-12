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
                
                // TODO: 必要事項を全て入力したらボタンが出現するようにする
                
                Button {
                    toIntSafety()
                } label: {
                    Text("Done")
                }
                .sheet(isPresented: $isShow) {
                    ChangedChairView()
                }
            }
            .navigationTitle("Random Chair")
        }
    }
    
    func toIntSafety() {
        
        guard let v = Int(vertical), let h = Int(horizontal) else {
            self.isShow = false
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
