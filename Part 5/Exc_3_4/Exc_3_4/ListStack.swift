
import Cocoa

class ListStack<T : Comparable> : CustomStringConvertible {
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
            while let _ = cell {
                length += 1
                cell = cell?.prev
            }
            return length
        }
    }
    func insertionSort(){
        let temp = ListStack<T>()
        for i in 0..<self.count{
            if let next_item = self.pop(){
                var inserted = false
                print("Value: \(next_item)")
                //print("Stack: \(self)")
                while let cell = curret {
                    temp.push(item: cell.value)
                    curret = cell.prev
                }
                print("Temp: \(temp)")
                var cn = 0
                while let cell = temp.curret {
                    if (next_item > cell.value && !inserted) || (cn == i  && !inserted)  {
                        self.push(item: next_item)
                        inserted = true
                    }
                    self.push(item: cell.value)
                    temp.curret = cell.prev
                    cn+=1
                    print("Iteration: \(temp) / \(self)")
                }
                print("Stack: \(self)")
            }
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

