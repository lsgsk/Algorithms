//
//  main.swift
//  Exc_1
//
//  Created by Lsgsk on 09.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Foundation

var list = LinkedList<Int>()
list.AddAtBeginning(3)
list.AddAtBeginning(2)
list.AddAtBeginning(1)
list.AddAtEnd(5)
list.AddAtEnd(6)
list.AddAtEnd(7)
list.insertAfter(after: 3, value: 10)
list.insertAfter(after: 7, value: 8)
list.AddAtEnd(9)
print(list)

