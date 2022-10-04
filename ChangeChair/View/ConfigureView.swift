//
//  ConfigureView.swift
//  ChangeChair
//
//  Created by nekonlu on 2022/10/03.
//  
//

import SwiftUI

struct ConfigureView: View {
    
    @State var vertical: String = ""
    @State var horizontal: String = ""
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
                
                Button {
                    // intend to fix
//                    setChairLayout.pushedConfirmButton(
//                        numVertical: Int(vertical)!,
//                        numHorizontal: Int(horizontal)!)
//                    print(setChairLayout.chairTable)
                    print("aaa")
                } label: {
                    Text("Done")
                }

            }
            .navigationTitle("Random Chair")
        }
    }
}

struct ConfigureView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigureView()
    }
}
