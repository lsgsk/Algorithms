import Cocoa

class LinkedList: CustomStringConvertible {
    private var top : ListCell?
    
    init() {
    }
    
    func createListWichCycle(){
        top = ListCell(5)
        var caret = top
        caret?.next = ListCell(2)
        caret = caret?.next
        caret?.next = ListCell(1)
        caret = caret?.next
        let point = ListCell(0)
        caret?.next = point
        caret = caret?.next
        caret?.next = ListCell(3)
        caret = caret?.next
        caret?.next = ListCell(8)
        caret = caret?.next
        caret?.next = ListCell(9)
        caret = caret?.next
        caret?.next = ListCell(7)
        caret = caret?.next
        caret?.next = point
    }
    
    func tryFindCycle(){
        var rabbit = top
        var turtle = top
        
        repeat {
            if rabbit == nil{
                print("There is no cycle")
                return
            }
            print("r:\(rabbit?.value ?? -1) / t:\(turtle?.value ?? -1)")
            rabbit = rabbit?.next?.next
            turtle = turtle?.next
        } while rabbit !== turtle
        
        print("FirstMeeting. r:\(rabbit?.value ?? -1) / t:\(turtle?.value ?? -1)")
        rabbit = top
        while rabbit !== turtle {
            rabbit = rabbit?.next
            turtle = turtle?.next
            print("r:\(rabbit?.value ?? -1) / t:\(turtle?.value ?? -1)")
        }
        print("Cycle beginning. r:\(rabbit?.value ?? -1) / t:\(turtle?.value ?? -1)")
        while turtle?.next !== rabbit {
            turtle = turtle?.next
        }
        turtle?.next = nil
        print("Interrupt cycle")
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
    
    fileprivate class ListCell{
        var value : Int
        var next : ListCell?
        init(_ value : Int) {
            self.value = value
        }
    }
}
