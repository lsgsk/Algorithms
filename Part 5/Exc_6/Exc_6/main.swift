//
//  main.swift
//  Exc_6
//
//  Created by Lsgsk on 07.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Foundation

var stack = ListStack<Int>()
stack.push(item: 3)
stack.push(item: 2)
stack.push(item: 4)
stack.push(item: 5)
stack.push(item: 1)
print(stack)
stack.selectionSort()
print(stack)
