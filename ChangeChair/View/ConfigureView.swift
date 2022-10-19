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
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.center)
                        Image(systemName: "multiply")
                        TextField("Horizontal", text: $horizontal)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.center)
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
                    ChangedChairView(setChairLayout: setChairLayout)
                }
                
                NavigationLink(
                    destination:SetUserAttrView(totalNum: setSafety()))
                {
                    Text("Set User Attribute")
                }
                
                
            }
            .navigationTitle("Random Chair")
        }
    }
    
    func setSafety() -> Int {
        
        guard let v = Int(vertical), let h = Int(horizontal) else {
            return 1
        }
        
        guard v > 0 && h > 0 else {
            return 1
        }
        
        return v * h
    }
    
}

struct ConfigureView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigureView()
    }
}
