import Cocoa

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
