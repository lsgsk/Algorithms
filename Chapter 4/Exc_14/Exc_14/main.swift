import Foundation

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
    
    func sumArrays(array : InterraptedArray) -> InterraptedArray{
        var tempRoot : ArrayRow? = nil
        var tempCurrent : ArrayRow? = nil
        var currentRow : ArrayRow? = root
        var currentAddingRow : ArrayRow? = array.root
        
        while currentRow != nil && currentAddingRow != nil {
            if currentRow!.RowNumber < currentAddingRow!.RowNumber{
                let item = ArrayRow(number: currentRow!.RowNumber)
                item.RowSentinel = sumEntries(currentRow?.RowSentinel, nil)
                setRow(&tempRoot, &tempCurrent, item)
                currentRow = currentRow?.NextRow
            }
            else if currentRow!.RowNumber > currentAddingRow!.RowNumber{
                let item = ArrayRow(number: currentAddingRow!.RowNumber)
                item.RowSentinel = sumEntries(nil,  currentAddingRow?.RowSentinel)
                setRow(&tempRoot, &tempCurrent, item)
                currentAddingRow = currentAddingRow?.NextRow
            }
            else{
                let item = ArrayRow(number: currentRow!.RowNumber)
                item.RowSentinel = sumEntries( currentRow?.RowSentinel,  currentAddingRow?.RowSentinel)
                setRow(&tempRoot, &tempCurrent, item)
                currentRow = currentRow?.NextRow
                currentAddingRow = currentAddingRow?.NextRow
            }
        }
        
        while currentRow != nil{
            let item = ArrayRow(number: currentRow!.RowNumber)
            item.RowSentinel = sumEntries(currentRow?.RowSentinel, nil)
            setRow(&tempRoot, &tempCurrent, item)
            currentRow = currentRow?.NextRow
        }
        while currentAddingRow != nil{
            let item = ArrayRow(number: currentAddingRow!.RowNumber)
            item.RowSentinel = sumEntries(nil,  currentAddingRow?.RowSentinel)
            setRow(&tempRoot, &tempCurrent, item)
            currentAddingRow = currentAddingRow?.NextRow
        }
        
        return InterraptedArray(root: tempRoot ?? ArrayRow(number: 0), width: max(self.width, array.width), height: max(self.height, array.height))
    }
    
    private func sumEntries(_ term1: ArrayEntry?, _ term2 : ArrayEntry?) -> ArrayEntry? {
        var rootEntryLine : ArrayEntry? = nil
        var currentEntryLine : ArrayEntry? = nil
        var t1 : ArrayEntry? = term1;
        var t2 : ArrayEntry? = term2
        while t1 != nil || t2 != nil {
            if t1 != nil && t2 != nil{
                if t1!.ColumnNumber < t2!.ColumnNumber{
                    let item = ArrayEntry(value: t1!.Value, number: t1!.ColumnNumber)
                    setColomn(&rootEntryLine, &currentEntryLine, item)
                    t1 = t1?.NextEntry
                } else if t1!.ColumnNumber > t2!.ColumnNumber{
                    let item = ArrayEntry(value: t2!.Value, number: t2!.ColumnNumber)
                    setColomn(&rootEntryLine, &currentEntryLine, item)
                    t2 = t2?.NextEntry
                }
                else{
                    let item = ArrayEntry(value: t1!.Value + t2!.Value, number: t1!.ColumnNumber)
                    setColomn(&rootEntryLine, &currentEntryLine, item)
                    t1 = t1?.NextEntry
                    t2 = t2?.NextEntry
                }
            }
            else if t1 != nil{
                let item = ArrayEntry(value: t1!.Value, number: t1!.ColumnNumber)
                setColomn(&rootEntryLine, &currentEntryLine, item)
                t1 = t1?.NextEntry
            }
            else if t2 != nil
            {
                let item = ArrayEntry(value: t2!.Value, number: t2!.ColumnNumber)
                setColomn(&rootEntryLine, &currentEntryLine, item)
                t2 = t2?.NextEntry
            }
        }
        return rootEntryLine
    }
    
    fileprivate func setRow(_ root: inout ArrayRow? ,_ current: inout ArrayRow?, _ item: ArrayRow) {
        if current == nil{
            current = item
            root = item
        }
        else{
            current?.NextRow = item
            current = item
        }
    }
    
    fileprivate func setColomn(_ root: inout ArrayEntry?, _ current: inout ArrayEntry?, _ item: ArrayEntry) {
        if current == nil{
            current = item
            root = item
        }
        else{
            current?.NextEntry = item
            current = item
        }
    }
    
}

let array : [[Int?]] = [[42,nil,nil,5],
                        [nil,nil,nil,nil],
                        [2, 10, 0,nil],
                        [6,16, nil,nil]]

let array2 : [[Int?]] = [[nil,1,nil],
                         [5, 1, 2],
                         [10,5, nil]]

var interraptedArray = InterraptedArray(array: array)
var interraptedArray2 = InterraptedArray(array: array2)
let sum = interraptedArray.sumArrays(array: interraptedArray2)
print(sum)



