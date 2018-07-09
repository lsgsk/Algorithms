//
//  main.swift
//  Exc_2
//
//  Created by Lsgsk on 09.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Foundation

let list = LinkedList<Int>()
list.AddAtBeginning(3)
list.AddAtBeginning(1)
list.AddAtBeginning(4)
list.AddAtBeginning(8)
list.AddAtBeginning(5)
list.AddAtBeginning(2)
list.AddAtBeginning(10)
list.AddAtBeginning(4)
list.AddAtBeginning(6)
print(list.findMaxValue() ?? -1)

