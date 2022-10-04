import UIKit

class SetChairLayout {
    
    var numVertical: Int = 0
    var numHorizontal: Int = 0
    var chairTable: [[Int]] = []

    func pushedConfirmButton(numVertical: Int, numHorizontal: Int) {
        self.numVertical = numVertical
        self.numHorizontal = numHorizontal
        var randomArray: [Int] = self.noOverlappingRandom(num: self.numVertical * self.numHorizontal)
        self.alignmentArray(array: randomArray)
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
            var randomIndex = Int.random(in: i ..< num)
            array.swapAt(i, randomIndex)
        }
        
        return array
    }
}

var s = SetChairLayout()
s.pushedConfirmButton(numVertical: 5, numHorizontal: 5)
