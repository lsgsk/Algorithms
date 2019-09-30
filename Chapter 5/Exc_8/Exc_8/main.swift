import Foundation

print("Hello, World!")

var queue = PrioritetQueue<Int>()
queue.Enqueue(value: 2, prioritet : Prioritet.Normal)
print(queue)
queue.Enqueue(value: 5, prioritet : Prioritet.High)
print(queue)
queue.Enqueue(value: 0, prioritet : Prioritet.Low)
print(queue)
queue.Enqueue(value: 1, prioritet : Prioritet.Normal)
print(queue)
queue.Enqueue(value: 4, prioritet : Prioritet.Low)
print(queue)
queue.Enqueue(value: 3, prioritet : Prioritet.High)
print(queue)
