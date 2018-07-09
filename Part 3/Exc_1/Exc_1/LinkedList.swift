import Cocoa

class LinkedList<T: Comparable>: CustomStringConvertible {
    private var top : ListCell<T>?
    private var bottom: ListCell<T>?
    
    func AddAtBeginning(_ value: T){
        let cell = ListCell<T>(value)
        if top == nil && bottom == nil {
            top = cell
            bottom = cell
            return
        }
        cell.next = top
        top = cell
    }
    
    func AddAtEnd(_ value : T){
        let cell = ListCell<T>(value)
        if top == nil && bottom == nil {
            top = cell
            bottom = cell
            return
        }
        bottom?.next = cell
        bottom = cell
    }
    
    func insertAfter(after: T, value: T){
        var carriage = top
        while let item = carriage, item.value != after  {
            carriage = item.next
        }
        let cell = ListCell<T>(value)
        cell.next = carriage?.next
        carriage?.next = cell
        if carriage?.value == bottom?.value{
            bottom = cell
        }
    }
    
    func deleteCell(value: T){
        if value == top?.value{
            top = top?.next
            return
        }
        var carriage = top
        while let item = carriage?.next, item.value != value  {
            carriage = item
        }
        carriage?.next = carriage?.next?.next
    }
    
    var description: String{
        var str = "List:"
        var carriage = top
        while let item = carriage {
            str += "\(item.value) "
            carriage = item.next
        }
        return str
    }
}
fileprivate class ListCell<T>{
    var value : T
    var next :ListCell<T>?
    init(_ value : T) {
        self.value = value
    }
}
