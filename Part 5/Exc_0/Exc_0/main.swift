//
//  main.swift
//  Exc_0
//
//  Created by Lsgsk on 06.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Foundation

print("Hello, World!")
var stack = ListStack<Int>()
stack.push(item: 1)
stack.push(item: 5)
stack.push(item: 3)
stack.push(item: 4)
stack.push(item: 2)
print(stack)
stack.insertionSort()
//stack.selectionSort()
print(stack)

//var queue = ListQueue<Int>()
//queue.Enqueue(value: 3)
//queue.Enqueue(value: 1)
//print(queue)
//print(queue.Dequeue())
//print(queue.Dequeue())
//print(queue.Dequeue())
//print(queue)

/*var queue = RingArrayQueue<Int>(max: 5)
queue.Enqueue(value: 3)
queue.Enqueue(value: 1)
queue.Enqueue(value: 5)
queue.Enqueue(value: 2)
queue.Enqueue(value: 4)
queue.Enqueue(value: 0)
queue.Enqueue(value: 0)
print(queue)
print(queue.dequeue())
print(queue.dequeue())
print(queue.dequeue())
queue.Enqueue(value: 0)
print(queue)
print(queue.dequeue())
print(queue.dequeue())
print(queue.dequeue())
print(queue.dequeue())
print(queue)*/

