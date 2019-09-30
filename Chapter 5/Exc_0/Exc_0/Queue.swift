//
//  Queue.swift
//  Exc_0
//
//  Created by Lsgsk on 06.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Cocoa

class ListQueue<T : Comparable>: CustomStringConvertible {
    private var head : QueueCell<T>?
    private var tail : QueueCell<T>?
    init() {
    }
    
    func Enqueue(value : T){
        let newCell  = QueueCell<T>(value: value)
        guard let _ = head, let tl = tail else {
            head = newCell
            tail = newCell
            return
        }
        tl.prev = newCell
        newCell.next = tl
        tail = newCell
    }
    
    func Dequeue() -> T?{
        guard let _ = head, let _ = tail else {
            return nil
        }
        let value = head?.value
        head = head?.prev
        head?.next = nil
        return value
    }
    
    
    public var description: String
    {
        var str = "ListQueue: "
        var cell = head
        while let item = cell {
            str  += "\(String(describing: item.value)) "
            cell = cell?.prev
        }
        return str
    }
}

fileprivate class QueueCell<T>{
    init(value:T) {
        self.value = value
    }
    let value : T
    var next : QueueCell<T>?
    var prev : QueueCell<T>?
    
}

class RingArrayQueue<T: Comparable>: CustomStringConvertible {
    private var queue : [T?]
    private var next : Int
    private var last : Int
    private var count: Int
    let max: Int
    init(max: Int) {
        self.max = max
        self.queue = Array(repeating: nil , count: max)
        self.next = 0
        self.last = 0
        self.count = 0
    }
    
    func Enqueue(value : T){
        if (count == max){
            print("No free space")
            return
        }
        queue[next] = value
        print("Added \(value)")
        next = (next + 1) % max
        count += 1
    }
    
    func dequeue() -> T?{
        if count == 0{
            print("Queue is empty")
            return nil
        }
        else{
            let value =  queue[last]
            count -= 1
            last = (last + 1) % max
            return value
        }
    }
    
    public var description: String
    {
        var str = "RingArrayQueue: ["
        var count = 0
        while count != self.count  {
            if let value = queue[(last + count) % max]{
                str += "\(value) "
            }
            count += 1
        }
        str += "]"
        return str
    }
}

