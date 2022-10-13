//
//  ChangeChairLogic.swift
//  ChangeChair
//
//  Created by nekonlu on 2022/10/03.
//  
//

import UIKit

import UIKit

class SetChairLayout: ObservableObject {
    
    @Published var numVertical: Int = 0
    @Published var numHorizontal: Int = 0
    @Published var chairTable: [[Int]] = []

    func pushedConfirmButton(numVertical: Int, numHorizontal: Int) {
        self.numVertical = numVertical
        self.numHorizontal = numHorizontal
        let randomArray: [Int] = self.noOverlappingRandom(num: self.numVertical * self.numHorizontal)
        self.alignmentArray(array: randomArray)
        
        print(chairTable)
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
            array.append(i + 1)
        }
        
        for i in 0..<num {
            let randomIndex = Int.random(in: i ..< num)
            array.swapAt(i, randomIndex)
        }
        
        return array
    }
}