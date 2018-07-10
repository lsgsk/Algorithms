//
//  main.swift
//  Exc_7
//
//  Created by Lsgsk on 10.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Foundation

var queue = HeapQueue()
queue.Enqueue(value: 5, prioritet: .High)
queue.Enqueue(value: 10, prioritet: .Low)
queue.Enqueue(value: 2, prioritet: .High)
queue.Enqueue(value: 6, prioritet: .Normal)
queue.Enqueue(value: 3, prioritet: .Low)
queue.Enqueue(value: 18, prioritet: .Normal)
queue.Enqueue(value: 6, prioritet: .High)
queue.Enqueue(value: 3, prioritet: .Normal)
queue.Enqueue(value: 5, prioritet: .Low)
print(queue)
print(queue.Dequeue())
print(queue)
queue.Enqueue(value: 9, prioritet: .High)
print(queue)

