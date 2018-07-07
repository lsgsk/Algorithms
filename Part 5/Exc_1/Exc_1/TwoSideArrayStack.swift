//
//  ArrayStack.swift
//  Exc_2
//
//  Created by Lsgsk on 05.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Cocoa

class TwoSideArrayStack<T> {
    private var array : [T?]
    private var headIndex : Int
    private var tailIndex : Int
    init(){
        self.array = Array(repeating: nil, count: 5)
        self.headIndex = -1
        self.tailIndex = array.count
    }
    
    func pushHead(item: T){
        headIndex += 1
        if headIndex < tailIndex{
            array[headIndex] = item
        }
        else{
            headIndex -= 1
            print("Stack is full off. \(headIndex)/\(tailIndex)")
        }
    }
    
    func pushTail(item: T){
        tailIndex -= 1
        if tailIndex > headIndex{
            array[tailIndex] = item
        }
        else{
            tailIndex += 1
            print("Stack is full off. \(headIndex)/\(tailIndex)")
        }
    }
    
    func popHead() -> T?{
        let value =  headIndex < 0 ? nil : array[headIndex]
        headIndex -= 1
        return value
    }
    
    func popTail() -> T?{
        let value =  tailIndex < array.count ? array[tailIndex] : nil
        tailIndex += 1
        return value
    }
}
