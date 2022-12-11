//
//  ChangeChairLogic.swift
//  ChangeChair
//
//  Created by nekonlu on 2022/10/03.
//  
//

import UIKit

class SetChairLayout: ObservableObject {
    
    @Published var numVertical: Int = 0
    @Published var numHorizontal: Int = 0
    @Published var chairTable: [[Int]] = []
    @Published var xxx: Bool = false

    func pushedConfirmButton(numVertical: Int, numHorizontal: Int) {
        self.numVertical = numVertical
        self.numHorizontal = numHorizontal
        let randomArray: [Int] = self.noOverlappingRandom(num: self.numVertical * self.numHorizontal)
        self.alignmentArray(array: randomArray)
        
        swapChair(userID: 17, targetY: 3, targetX: 0)
        swapChair(userID: 8, targetY: 2, targetX: 6)
        swapChair(userID: 41, targetY: 5, targetX: 5)
        
        swapChair(userID: 35, targetY: 0, targetX: Int.random(in: 0..<numHorizontal))
    }
    
    // 特別な事情がある方用
    func swapChair(userID: Int, targetY: Int, targetX: Int) {
        // targetY, targetXにswapさせたいuserIDの座標
        var posY: Int = 0
        var posX: Int = 0
        
    for_i: for i_Y in 0 ..< chairTable.count {
            for j_X in 0 ..< chairTable[0].count {
                if chairTable[i_Y][j_X] == userID {
                    posY = i_Y
                    posX = j_X
                    break for_i
                }
            }
        }
        
        var foo = self.chairTable[posY][posX]
        self.chairTable[posY][posX] = self.chairTable[targetY][targetX]
        self.chairTable[targetY][targetX] = foo
    }
    
    func alignmentArray(array: [Int]) {
        var preArray: [Int] = []
        for i in 0 ..< array.count {
            preArray.append(array[i])
            if (i + 1) % numHorizontal == 0 {
                chairTable.append(preArray)
                preArray = []
            }
            
        }
    }
    
    func noOverlappingRandom(num: Int) -> [Int] {
        var array: [Int] = []
        for i in 0..<num {
            array.append(i)
        }
        
        for i in 0..<num {
            let randomIndex = Int.random(in: i ..< num)
            array.swapAt(i, randomIndex)
        }
        
        return array
    }
}
