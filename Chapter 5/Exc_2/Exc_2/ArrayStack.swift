//
//  ArrayStack.swift
//  Exc_2
//
//  Created by Lsgsk on 05.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Cocoa

class ArrayStack<T> {
    private var array : [T?]
    private var curret : Int
    init(){
        self.array = Array(repeating: nil, count: 100)
        self.curret = -1
    }
    
    func push(item: T){
        curret += 1
        if curret < array.count{
            array[curret] = item
        }else{
            print("Stack is full off")
        }
    }
    
    func pop() -> T?{
        let value =  curret < 0 ? nil : array[curret]
        curret -= 1
        return value
    }
}
