//
//  HeapQueue.swift
//  Exc_7
//
//  Created by Lsgsk on 10.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Cocoa

class HeapQueue: CustomStringConvertible {
    private var array : [Int]
    //private var prioritets : [Int]
    var count : Int
    init() {
        self.array = Array(repeating: 0, count: 10)
        self.count = 0
    }
    
    func Enqueue(value : Int){
        if count == array.count{
            print("Queue is full off")
            return
        }
        array[count] = value
        count += 1
        //validate(values: &array, count: count)
        makeHeap(values: &array)
    }
    
    func Dequeue() -> Int?{
        return 0
    }
    
    
    public var description: String
    {
        var str = "HeapQueue: "
        for item in array{
            str  += "\(String(describing: item)) "
        }
        return str
    }
    fileprivate func makeHeap(values : inout [Int]){
        for i in 0..<self.count{
            var index = i
            while index != 0{
                let parent = (index - 1) / 2
                if values[index] <= values[parent]{
                    break
                }
                let temp = values[index]
                values[index] = values[parent]
                values[parent] = temp
                index = parent
            }
        }
    }
    fileprivate func validateHeap(values : inout [Int], count : Int){
        var index = count-1
        while (true){
            let parent = (index - 1) / 2
            if ((values[index] > values[parent])) {
                let temp = values[index]
                values[index] = values[parent]
                values[parent] = temp
                index = parent
            }
            else{
                break
            }
        }
    }
}

enum Prioritet {
    case Low
    case Normal
    case High
}



