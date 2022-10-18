//
//  ChangedChairView.swift
//  ChangeChair
//
//  Created by nekonlu on 2022/10/04.
//  
//

import SwiftUI

struct ChangedChairView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var setChairLayout: SetChairLayout
    
    let desplayId_ViewSize: CGFloat = 40
    
    var body: some View {
        
        VStack(alignment: .center) {
//            Button {
//                // Preview Only
//                setChairLayout.pushedConfirmButton(
//                    numVertical: 5,
//                    numHorqizontal: 5)
//                // End
//
//
//
//            } label: {
//                Text("Set")
//            }
            
            Text("FRONT")
                .font(.caption)
                .fontWeight(.bold)
            
            
            ForEach(setChairLayout.chairTable, id: \.self) { tate in
                HStack {
                    ForEach(tate, id: \.self) { yoko in
                        Text("\(yoko)")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: desplayId_ViewSize,
                                   height: desplayId_ViewSize)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                            )
                    }
                }
            }
            
            Text("BACK")
                .font(.caption)
                .fontWeight(.bold)
                .padding()
            
            Button {
                setChairLayout.chairTable = []
                dismiss()
            } label: {
                Text("戻る")
                    
            }
        }
    }
}

struct ChangedChairView_Previews: PreviewProvider {
    static var previews: some View {
        ChangedChairView(setChairLayout: SetChairLayout())
    }
}
