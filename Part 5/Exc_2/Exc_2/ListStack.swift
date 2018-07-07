
import Cocoa

class ListStack<T> : CustomStringConvertible {
    private var curret: StackCell<T>?
    func push(item: T){
        let cell = StackCell(value: item)
        if curret == nil{
            curret = cell
        }
        else{
            cell.prev = curret
            curret = cell
        }
    }
    func pop() -> T?{
        if curret != nil{
            let value = curret?.value
            curret = curret?.prev
            return value
        }else{
            return nil
        }
    }
    
    public var description: String
    {
        var str = "Stack: "
        var cell = curret
        while let item = cell {
            str  += "\(String(describing: item.value)) "
            cell = cell?.prev
        }
        return str
    }
    
    func rever() -> ListStack<T>{
        let stack = ListStack<T>()
        var cell = curret
        while let item = cell {
            stack.push(item: item.value)
            cell = cell?.prev
        }
        return stack
    }
    
    var count : Int{
        get{
            var length = 0;
            var cell = curret
            while let item = cell {
                length += 1
                cell = cell?.prev
            }
            return length
        }
    }    
}

fileprivate class StackCell<T>{
    init(value:T) {
        self.value = value
    }
    let value : T
    var prev : StackCell<T>?
    
}
