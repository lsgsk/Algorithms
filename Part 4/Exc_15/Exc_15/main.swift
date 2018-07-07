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

class InterraptedArray: CustomStringConvertible{
    private let root : ArrayRow
    let width : Int
    let height : Int
    
    private init(root : ArrayRow, width : Int, height: Int){
        self.root = root
        self.width = width
        self.height = height
    }
    
    init(array : [[Int?]]) {
        var tempRoot : ArrayRow?
        var currentRow : ArrayRow?
        var currentEntry : ArrayEntry?
        
        var maxWidth = 0;
        for i in 0..<array.count{
            maxWidth = max(maxWidth, array[i].count)
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
        self.height = array.count
        self.width = maxWidth
        self.root =  tempRoot ?? ArrayRow(number: 0)
    }
    
    public var description: String
    {
        var description =  "InterraptedArray: \n"
        var currentRow : ArrayRow? = root
        while currentRow != nil {
            var currentEntry = currentRow?.RowSentinel
            while currentEntry != nil{
                description += "\(currentEntry!.Value) "
                currentEntry = currentEntry?.NextEntry
            }
            description += "\n"
            currentRow = currentRow?.NextRow
        }
        return description
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
        return nil
    }
    
    func multiplyArrays(array : InterraptedArray) ->  InterraptedArray{
        //алгоритм умножения очень не нарациональный. Ну и похуй
        var result :[[Int?]] = Array(repeating: Array(repeating: nil, count: self.height), count: array.width)
        for i in 0..<result.count{
            for j in 0..<result[i].count{
                for k in 0..<self.width{
                    let value1 = self.getValue(i: i, j: k)
                    let value2 = array.getValue(i: k, j: j)
                    if value1 != nil && value2 != nil
                    {
                        result[i][j] = (result[i][j] ?? 0) + (value1 ?? 0) * (value2 ?? 0)
                    }
                }
                print("\n")
            }
        }
        return InterraptedArray(array: result)
    }
}

let array : [[Int?]] = [[2,  nil, nil, 5],
                        [nil, nil, nil, nil],
                        [2,   1,  0,   nil],]

let array2 : [[Int?]] = [[nil, 1,   nil],
                         [5,   1,   2],
                         [1,  5,   nil],
                         [1,   nil, 3]]

var interraptedArray = InterraptedArray(array: array)
var interraptedArray2 = InterraptedArray(array: array2)
var milt = interraptedArray.multiplyArrays(array: interraptedArray2)
print(milt)


