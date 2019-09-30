
import Cocoa

class ListStack<T : Comparable> : CustomStringConvertible {
    private var curret: StackCell<T>?
    
    func searchIndex(value: T) -> Int{
        var index : Int? =  nil
        var cell = curret
        while let item = cell {
            if item.value == value{
                return index ?? 0
            }
            index = (index ?? 0) + 1
            cell = cell?.prev
        }
        return -1
    }
    
    
    func push(_ item: T){
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
    
    func dump() -> [T]{
        var array = [T]()
        var cell = curret
        while let item = cell {
            array.append(item.value)
            cell = cell?.prev
        }
        return array
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
            stack.push(item.value)
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
                    temp.push(cell.value)
                    curret = cell.prev
                }
                print("Temp: \(temp)")
                var cn = 0
                while let cell = temp.curret {
                    if (next_item > cell.value && !inserted) || (cn == i  && !inserted)  {
                        self.push(next_item)
                        inserted = true
                    }
                    self.push(cell.value)
                    temp.curret = cell.prev
                    cn+=1
                    print("Iteration: \(temp) / \(self)")
                }
                if !inserted{
                    self.push( next_item)
                }
                print("Stack: \(self)")
            }
        }
    }
    
    func selectionSort(){
        let temp = ListStack<T>()
        let count = self.count
        for i in 0..<count{
            if var largist_item = self.pop(){
                print("Large value: \(largist_item)")
                var depth = count - i
                while let cell = curret, depth > 0{
                    if(cell.value > largist_item){
                        temp.push( largist_item)
                        largist_item = cell.value
                    }
                    else{
                        temp.push(cell.value)
                    }
                    curret = cell.prev
                    depth -= 1
                    print("Large value: \(largist_item), Iteration: \(temp) / \(self)")
                }
                self.push( largist_item)
                while let cell = temp.curret {
                    self.push(cell.value)
                    temp.curret = cell.prev
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

