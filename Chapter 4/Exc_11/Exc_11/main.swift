import Foundation

class ArrayRow{
    var RowNumber : Int
    var NextRow : ArrayRow?
    var RowSentinel : ArrayEntry?
    
    init(number : Int) {
        self.RowNumber = number
    }
}
class ArrayEntry {
    var ColumnNumber : Int
    var Value : Int
    var NextEntry : ArrayEntry?
    
    init(value : Int, number : Int) {
        self.Value = value
        self.ColumnNumber = number
    }
}

class InterraptedArray{
    private var root : ArrayRow
    init(array : [[Int?]]) {
        var currentRow : ArrayRow? = nil
        var currentEntry : ArrayEntry? = nil
        var tempRoot : ArrayRow?
        
        for i in 0..<array.count{
            for j in 0..<array[i].count{
                if let value = array[i][j]{
                    if currentRow == nil{
                        currentRow = ArrayRow(number: i)
                    }
                    else if let row = currentRow, i != row.RowNumber{
                        let next = ArrayRow(number: i)
                        row.NextRow = next
                        currentRow = next
                        currentEntry = nil
                    }
                    let entry = ArrayEntry(value: value, number: j)
                    if currentEntry == nil{
                        currentRow!.RowSentinel = entry
                    } else {
                        currentEntry?.NextEntry = entry
                    }
                    currentEntry = entry
                    if let row = currentRow, tempRoot == nil {
                        tempRoot = row
                    }
                }
            }
        }
        root = tempRoot ?? ArrayRow(number: 0)
    }
    
    func getValue(i : Int, j : Int) -> Int?{
        var currentRow : ArrayRow? = root
        var currentEntry : ArrayEntry? = nil
        while let row = currentRow, row.RowNumber < i {
            currentRow = currentRow?.NextRow
        }
        if let row = currentRow, row.RowNumber == i {
            currentEntry = row.RowSentinel
            while let col = currentEntry, col.ColumnNumber < j {
                currentEntry = currentEntry?.NextEntry
            }
            if let col = currentEntry, col.ColumnNumber == j{
                return col.Value
            }
        }
        return nil    }
}

class TriangleInterraptedArray : InterraptedArray{
    init(triangleArray : [[Int?]]) {
        var temp = triangleArray
        for i in 0..<array.count{
            for j in 0..<array[i].count{
                if j > i{
                    temp[i][j] = nil
                }
            }
        }
        super.init(array: temp)
    }
    
    override func getValue(i : Int, j : Int) -> Int?{
        return j > i ? super.getValue(i: j, j: i) : super.getValue(i: i, j: j)
        
    }
    
}

let array : [[Int?]] = [[42,nil,nil,27],
                        [nil,nil,nil,nil],
                        [32, 10, 50,nil],
                        [nil,16, nil,6]]

var interraptedArray = InterraptedArray(array: array)
var triangelInterraptedArray = TriangleInterraptedArray(triangleArray: array)

print(interraptedArray.getValue(i: 2, j: 1))
print(triangelInterraptedArray.getValue(i: 0, j: 2))
