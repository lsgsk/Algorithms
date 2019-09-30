//
//  main.swift
//  Exc_9
//
//  Created by Lsgsk on 10.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Foundation
//var array = [2, 12, 5, 11, 1, 14, 8, 4, 9, 3, 6, 10, 15, 0, 13]
var array = Array(repeating: 0, count: 20)
for i in 0..<array.count{
    array[i] = Int(arc4random_uniform(UInt32(100)))
}
print(array)
headSort(values: &array)
print(array)


