//
//  test.swift
//  ChangeChair
//
//  Created by nekonlu on 2022/10/12.
//  
//

import SwiftUI

struct test: View {
    
    let horizontalCount = 3;
    let grids = Array(repeating: GridItem(), count: 2)
    
    var body: some View {
        VStack {
            ForEach((1...5), id: \.self) { num in
                HStack {
                    ForEach((1...5), id: \.self) {j in
                        Text("\(j)")
                            .frame(width: 30, height: 30)
                            .background(Color.black)
                    }
                }
            }
        }
        
    }
}  

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
