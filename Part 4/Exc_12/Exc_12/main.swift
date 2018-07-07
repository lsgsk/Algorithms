import Foundation

class TriangularArray : CustomStringConvertible {
    var length : Int
    var count : Int
    internal var trArray : [Int]
    internal init(_ array : [[Int]]) {
        self.length = array.count
        self.count = TriangularArray.countArrayLength(array)
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
    
    internal static func countArrayLength(_ array : [[Int]]) -> Int{
        return Int(truncating:((pow(Decimal(array.count), 2) + Decimal(array.count)) / 2) as NSDecimalNumber)
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
    func sumTriangularArray(_ array : TriangularArray) -> TriangularArray{
        let large : TriangularArray = self.count >= array.count ? self : array
        let small = self.count < array.count ? self : array
        var result = Array(repeating: Array(repeating: 0, count: large.length), count: large.length)
        for i in 0..<large.length{
            for j in 0...i{
                    result[i][j] = large[i,j] + (i < small.length && j < small.length ? small[i, j] : 0)
            }
        }
        return TriangularArray(result)
    }
}

let array1 : [[Int]] = [[42,12,32,27],
                        [12,15,10,16],
                        [32,10,19, 8],
                        [27,16, 8, 6]]
let array2 : [[Int]] = [[1,2,3],
                        [2,3,4],
                        [3,4,5]]
var triangle1 = TriangularArray(array1)
var triangle2 = TriangularArray(array2)
print(triangle1.sumTriangularArray(triangle2))


