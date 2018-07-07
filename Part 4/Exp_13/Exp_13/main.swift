import Foundation

class TriangularArray : CustomStringConvertible {
    var length : Int
    var count : Int
    internal var trArray : [Int]
    internal init(_ array : [[Int]]) {
        self.length = array.count
        self.count = Int(truncating:((pow(Decimal(array.count), 2) + Decimal(array.count)) / 2) as NSDecimalNumber)
        self.trArray = [Int](repeating: 0, count: self.count)
        var index  = 0
        for i in 0..<array.count{
            for j in 0..<array[i].count{
                if j <= i {
                    self.trArray[index] = array[i][j]
                    index += 1
                }
                else{
                    break
                }
            }
        }
    }
    
    func findIndex(_ i: Int, _ j: Int) -> Int{
        let validated = validateIndexes(i: i, j: j)
        return (validated.i * validated.i + validated.i) / 2 + validated.j
    }
    
    func validateIndexes(i: Int, j: Int) -> (i: Int, j: Int){
        return i >= j ? (i, j) : (j,i)
    }
    
    subscript(_ i: Int, _ j: Int) -> Int{
        get{
            return trArray[findIndex(i, j)]
        }
        set(newValue){
            trArray[findIndex(i, j)] = newValue
        }
    }
    
    public var description: String { return "TriangularArray: \(trArray)" }
}

extension TriangularArray{
    func multTriangularArray(_ array : TriangularArray) -> TriangularArray {
        if self.count == 0 || array.count == 0 || array.length != self.length {
            return TriangularArray([])
        }
        var result = Array(repeating: Array(repeating: 0, count: self.length), count: self.length)
        for i in 0..<self.length{
            for j in 0..<self.length{
                for k in 0..<array.length{
                    result[i][j] += self[k,j] * array[i,k]
                }
            }
        }
        return TriangularArray(result)
    }
}

let array1 : [[Int]] = [[5,6,1],
                        [6,4,0],
                        [1,0,2]]
let array2 : [[Int]] = [[1,2,3],
                        [2,3,4],
                        [3,4,5]]
var triangle1 = TriangularArray(array1)
var triangle2 = TriangularArray(array2)
print(triangle1.multTriangularArray(triangle2))



