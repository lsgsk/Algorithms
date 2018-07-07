import Foundation

var queue = ListQueue<Int>()
queue.Enqueue(value: 2)
queue.Enqueue(value: 1)
queue.Enqueue(value: 5)
queue.Enqueue(value: 0)
queue.Enqueue(value: 4)
queue.selectionSort()
print(queue)
