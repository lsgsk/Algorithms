import Foundation

func queueQuickSort(_ queue: inout ListQueue<Int>){
    if let divider = queue.Dequeue(){
        var less = ListQueue<Int>()
        var more = ListQueue<Int>()
        while let item = queue.Dequeue() {
            if item > divider{
                more.Enqueue(item)
            } else{
                less.Enqueue(item)
            }
        }
        queueQuickSort(&less)
        queueQuickSort(&more)
        
        print("\(less.dump()) \(divider) \(more.dump())")
        let copy = {
            (target: ListQueue<Int>, source: ListQueue<Int>) in
            while let item = source.Dequeue() {
                target.Enqueue(item)
            }
        }
        copy(queue, less)
        queue.Enqueue(divider)
        copy(queue, more)
    }
}
print("Hello, World!")
var queue = ListQueue<Int>()

queue.Enqueue(8)
queue.Enqueue(2)
queue.Enqueue(6)
queue.Enqueue(0)
queue.Enqueue(5)
queue.Enqueue(7)
queue.Enqueue(4)
queue.Enqueue(1)
queue.Enqueue(9)
queue.Enqueue(3)

print(queue)
queueQuickSort(&queue)
print(queue)


