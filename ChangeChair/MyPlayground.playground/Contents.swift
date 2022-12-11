import SwiftUI

class Model {
    
    var numVertical: Int = 0
    var numHorizontal: Int = 0
    var chairTable: [[Int]] = []

    func pushedConfirmButton(numVertical: Int, numHorizontal: Int) {
        self.numVertical = numVertical
        self.numHorizontal = numHorizontal
        var randomArray: [Int] = self.noOverlappingRandom(num: self.numVertical * self.numHorizontal)
        print(Set(randomArray).count)
        self.alignmentArray(array: randomArray)
    }
    
    func dispChairTable() {
        for i in chairTable {
            print(i)
        }
    }
    
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
    
//    // 特別な事情がある人用
//    func swapChair(userID: Int, targetY: Int, targetX: Int) {
//        var pos6_x: Int = 0
//        var pos6_y: Int = 0
//        var rowNum: Int = 0
//        var colNum: Int = 0
//
//        for_row: for row in chairTable {
//            for element in row {
//                if element == userID {
//                    pos6_y = rowNum
//                    pos6_x = colNum
//                    break for_row
//                }
//                colNum += 1
//
//            }
//            colNum = 0
//            rowNum += 1
//        }
//
//        print(rowNum, colNum)
//
//        chairTable[pos6_y][pos6_x] = chairTable[4][0]
//        chairTable[targetY][targetX] = userID
//    }
    
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

var model = Model()

model.pushedConfirmButton(numVertical: 6, numHorizontal: 7)
model.dispChairTable()
model.swapChair(userID: 7, targetY: 5, targetX: 0)
print("-----")
model.dispChairTable()
