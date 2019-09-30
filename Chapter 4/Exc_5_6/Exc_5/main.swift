import Foundation

class TriangularArray : CustomStringConvertible {
    internal var trArray : [Int]
    internal init(_ array : [[Int]]) {
        self.trArray = [Int](repeating: 0, count: TriangularArray.countArrayLength(array))
    }
    
    internal static func countArrayLength(_ array : [[Int]]) -> Int{
        return Int(truncating:((pow(Decimal(array.count), 2) + Decimal(array.count)) / 2) as NSDecimalNumber)
    }
    
    func findIndex(_ i: Int, _ j: Int) -> Int{
          preconditionFailure("This method must be overridden")
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

class DownTriangularArray : TriangularArray{
    override init(_ array : [[Int]]) {
        super.init(array)
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
    override func findIndex(_ i: Int, _ j: Int) -> Int{
        let validated = validateIndexes(i: i, j: j)
        return (validated.i * validated.i + validated.i) / 2 + validated.j
    }
    
    func validateIndexes(i: Int, j: Int) -> (i: Int, j: Int){
        return i >= j ? (i, j) : (j,i)
    }
    
    public override var description: String
    {
        var desc = "DownTriangularArray: \(trArray) \n["
        var itemsInLine = 1
        var index = 0
        while index < trArray.count {
            desc += "\n   "
            for _ in (0..<itemsInLine).reversed(){
                desc += String(format: "%02d ", trArray[index])
                index += 1
            }
            
            itemsInLine += 1
        }
        desc += "\n"
        desc += "]"
        return desc
    }
}

class UpTriangularArray : TriangularArray{
    override init(_ array : [[Int]]) {
        self.length = array.count
        super.init(array)
        var index  = 0
        for i in 0..<array.count{
            for j in i..<array[i].count{
                if j >= i {
                    self.trArray[index] = array[i][j]
                    index += 1
                }
                else{
                    break
                }
            }
        }
    }
    
    private var length : Int
    
    override func findIndex(_ i: Int, _ j: Int) -> Int{
        let validated = validateIndexes(i: i, j: j)
        var stepLength = length - 1
        var curretIndex = 0
        for _ in 0..<validated.i{
            curretIndex += stepLength
            stepLength -= 1
        }
        return curretIndex + validated.j
    }
    
    func validateIndexes(i: Int, j: Int) -> (i: Int, j: Int){
        return j > i ? (i, j) : (j,i)
    }
    
    public override var description: String
    {
        var desc = "UpTriangularArray: \(trArray) \n["
        var itemsInLine = length
        var index = 0
        while index < trArray.count {
            desc += "\n   "
            for _ in 0..<(length - itemsInLine){
                desc += "   "
            }
            for _ in 0..<itemsInLine {
                desc += String(format: "%02d ", trArray[index])
                index += 1
            }
            
            itemsInLine -= 1
        }
        desc += "\n"
        desc += "]"
        return desc
    }
}

let array : [[Int]] = [[42,12,32,27],
                       [12,15,10,16],
                       [32,10,19, 8],
                       [27,16, 8, 6]]
var dtrArray = DownTriangularArray(array)
//print("\(dtrArray[0,0]) \(dtrArray[0,1]) \(dtrArray[0,2]) \(dtrArray[0,3]) \(dtrArray[1,0]) \(dtrArray[1,1]) \(dtrArray[1,2]) \(dtrArray[1,3]) \(dtrArray[2,0]) \(dtrArray[2,1]) \(dtrArray[2,2]) \(dtrArray[2,3]) \(dtrArray[3,0]) \(dtrArray[3,1]) \(dtrArray[3,2]) \(dtrArray[3,3])")
print(dtrArray)
print("++++++++++++++++++++")
let utrArray = UpTriangularArray(array)
//print("\(utrArray[0,0]) \(utrArray[0,1]) \(utrArray[0,2]) \(utrArray[0,3]) \(utrArray[1,0]) \(utrArray[1,1]) \(utrArray[1,2]) \(utrArray[1,3]) \(utrArray[2,0]) \(utrArray[2,1]) \(utrArray[2,2]) \(utrArray[2,3]) \(utrArray[3,0]) \(utrArray[3,1]) \(utrArray[3,2]) \(utrArray[3,3])")
print(utrArray)
