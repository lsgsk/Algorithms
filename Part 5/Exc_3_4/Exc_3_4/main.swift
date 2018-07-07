import Foundation

var stack = ListStack<Int>()
stack.push(item: 3)
stack.push(item: 2)
stack.push(item: 4)
stack.push(item: 5)
stack.push(item: 1)
print(stack)
stack.insertionSort()
print(stack)
