//
//  main.swift
//  Exc_0
//
//  Created by Lsgsk on 08.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Foundation

print("Hello, World!")
let list = LinkedList<Int>()
//let list = TwiSideLinkedList<Int>()
/*list.AddAtEnd(4)
list.AddAtBeginning(3)
list.AddAtBeginning(2)
list.AddAtBeginning(1)
list.AddAtEnd(5)
list.AddAtEnd(6)*/
/*list.insertAfter(after: 5, value: 6)
list.AddAtBeginning(3)
list.AddAtEnd(5)
list.insertAfter(after: 2, value: 4)
list.insertAfter(after: 3, value: 4)*/
//list.deleteCell(value: 4)
//list.deleteCell(value: 3)
var copy = list.copyList()
copy.AddAtBeginning(0)
print(list)
print(copy)
