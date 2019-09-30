//
//  Quicksort.swift
//  Exc_0
//
//  Created by Lsgsk on 10.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Cocoa

func Quicksort(values: inout [Int], start: Int, end: Int){
    if start >= end{
        return
    }
    let divider = values[start]
    var lo = start
    var hi = end
    while true{
        while values[hi] >= divider{
            hi -= 1
            if hi <= lo{
                break
            }
        }
        if hi <= lo {
            values[lo] = divider
            break
        }
        values[lo] = values[hi]
        print("Changed:  \(values)")
        lo += 1
        while values[lo] < divider{
            lo +=  1
            if lo >= hi{
                break
            }
        }
        if lo >= hi{
            lo = hi
            values[hi] = divider
            break
        }
        values[hi] = values[lo]
        print("Changed:  \(values)")
    }
    print("Before recursion:  \(values)")
    Quicksort(values: &values, start: start, end: lo-1)
    Quicksort(values: &values, start: lo + 1, end: end)
}
