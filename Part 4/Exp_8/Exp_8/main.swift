//
//  main.swift
//  Exp_8
//
//  Created by Lsgsk on 03.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Foundation

func createDiagonalArray(size: Int) -> [[Int]]{
    var array = Array(repeating: Array(repeating: 0, count: size), count: size)
    for i in 0..<size{
        for j in 0..<size{
            if j >= i{
                array[i][j] = 1
            }
        }
    }
    return array
}

var array = createDiagonalArray(size: 5)
for item in array{
    print(item)
}
