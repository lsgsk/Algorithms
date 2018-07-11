import Foundation

func stackQuickSort(stack: inout ListStack<Int>){
    if let divider = stack.pop(){
        var less = ListStack<Int>()
        var more = ListStack<Int>()
        while let item = stack.pop() {
            if item > divider{
                more.push(item)
            } else{
                less.push(item)
            }
        }
        stackQuickSort(stack: &less)
        stackQuickSort(stack: &more)
        
        print("\(less.dump()) \(divider) \(more.dump())")
        let copy = {
            (target: ListStack<Int>, source: ListStack<Int>) in
            while let item = source.pop() {
                target.push(item)
            }
        }
        let temp = ListStack<Int>()
        copy(temp, less)
        temp.push(divider)
        copy(temp, more)
        copy(stack, temp)
    }
}
print("Hello, World!")
var stack = ListStack<Int>()

stack.push(8)
stack.push(2)
stack.push(6)
stack.push(0)
stack.push(5)
stack.push(7)
stack.push(4)
stack.push(1)
stack.push(9)
stack.push(3)

print(stack)
stackQuickSort(stack: &stack)
print(stack)

