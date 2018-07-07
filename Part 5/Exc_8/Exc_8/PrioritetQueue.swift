import Cocoa

class PrioritetQueue<T : Comparable> : CustomStringConvertible {
    private var head : QueueCell<T>?
    private var tail : QueueCell<T>?
    init() {
    }
    
    func Enqueue(value : T, prioritet : Prioritet){
        let newCell  = QueueCell(value: value, prioritet: prioritet)
        guard let _ = head, let _ = tail else {
            head = newCell
            tail = newCell
            return
        }
        
        var iterator = head
        while let cell = iterator{
            if cell.prioritet.rawValue >= prioritet.rawValue{
                if let next = cell.prev{
                     iterator = next
                }else{
                    cell.prev = newCell
                    newCell.next = cell
                    tail = newCell
                    iterator = nil
                }
            }
            else{
                if let next = cell.next{
                    next.prev = newCell
                    newCell.next = next
                    newCell.prev = cell
                }else{
                    newCell.prev = cell
                    cell.next = newCell
                    head = newCell
                }
                iterator = nil
            }
        }
    }
    
    func Dequeue() -> T?{
        guard let _ = head, let _ = tail else {
            return nil
        }
        let value = head?.value
        head = head?.prev
        head?.next = nil
        return value
    }
 
    
    public var description: String
    {
        var str = "PrioritetQueue: "
        var cell = head
        while let item = cell {
            str  += "\(String(describing: item.value)) "
            cell = cell?.prev
        }
        return str
    }
}

enum Prioritet : Int {
    case Low
    case Normal
    case High
}

fileprivate class QueueCell<T : Comparable> : Comparable {
    
    init(value: T, prioritet: Prioritet) {
        self.value = value
        self.prioritet = prioritet
    }
    
    static func < (lhs: QueueCell<T>, rhs: QueueCell<T>) -> Bool {
        return lhs.value < rhs.value
    }
    
    static func == (lhs: QueueCell<T>, rhs: QueueCell<T>) -> Bool {
       return lhs.value == rhs.value
    }
    
    var value : T
    var prioritet : Prioritet
    var next : QueueCell<T>?
    var prev : QueueCell<T>?
}
