//
//  main.swift
//  Exc_9
//
//  Created by Lsgsk on 07.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Foundation

var queue = DequeQueue<Int>()
queue.Enqueue(value: 2)
queue.EnqueueToFirst(value: 5)
queue.Enqueue(value: 0)
queue.Enqueue(value: 1)
queue.EnqueueToFirst(value: 4)
queue.Enqueue(value: 3)
print(queue)
print(queue.Dequeue())
print(queue.DequeueLast())


