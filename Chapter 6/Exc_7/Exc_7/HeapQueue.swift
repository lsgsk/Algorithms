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
    private var prioritets : [Prioritet]
    var count : Int
    init() {
        self.array = Array(repeating: 0, count: 10)
        self.prioritets = Array(repeating: .Low, count: 10)
        self.count = 0
    }
    
    func Enqueue(value : Int, prioritet: Prioritet){
        if count == array.count{
            print("Queue is full off")
            return
        }
        array[count] = value
        prioritets[count] = prioritet
        count += 1
        addBottomItem()
    }
    
    func Dequeue() -> Int?{
        if count == 0{
            print("Queue is empty")
            return nil
        }
        return removeTopItem();
    }
    
    
    public var description: String
    {
        var str = "HeapQueue: "
        for i in 0..<self.count{
            str  += "\(String(describing: array[i]))/\(String(describing: prioritets[i]).first!) "
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
    
    fileprivate func addBottomItem(){
        var index = self.count-1
        while (true){
            let parent = (index - 1) / 2
            if ((self.prioritets[index].rawValue > self.prioritets[parent].rawValue)) {
                let temp = self.array[index]
                self.array[index] = self.array[parent]
                self.array[parent] = temp
                
                let ptemp = self.prioritets[index]
                self.prioritets[index] = self.prioritets[parent]
                self.prioritets[parent] = ptemp
                
                index = parent
            }
            else{
                break
            }
        }
    }
    fileprivate func removeTopItem() -> Int{
        let result = self.array[0]
        self.array[0] = self.array[count-1]
        var index = 0
        while (true){
            var child1 = 2 * index + 1
            var child2 = 2 * index + 2
            if (child1 >= self.count){
                child1 = index
            }
            if (child2 >= self.count){
                child2 = index
            }
            if ((self.array[index] >= self.array[child1]) && (self.array[index] >= self.array[child2])) {
                break
            }
            var swap_child = 0
            if (self.array[child1] > self.array[child2]){
                swap_child = child1
            }
            else{
                swap_child = child2
            }
            // Меняем местами с большим дочерним элементом.
            let temp = self.array[index]
            self.array[index] = self.array[swap_child]
            self.array[swap_child] = temp
            index = swap_child
        }
        return result
    }
}

enum Prioritet :Int {
    case Low
    case Normal
    case High
}



