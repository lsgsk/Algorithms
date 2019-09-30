//
//  main.swift
//  Exc_3
//
//  Created by Lsgsk on 11.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Foundation

print("Hello, World!")
var list = ListStack<Int>()
list.push(5)
list.push(2)
list.push(8)
list.push(7)
list.push(3)
print(list)
print(list.searchIndex(value: 2))
print(list.searchIndex(value: 10))
