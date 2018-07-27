//
//  Queue.swift
//  Exc_0
//
//  Created by Lsgsk on 06.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Cocoa

class ListQueue<T>: CustomStringConvertible {
    private var head : QueueCell<T>?
    private var tail : QueueCell<T>?
    private var count : Int = 0
    init() {
    }
    
    var isEmpty : Bool{
        get{
            return head == nil
        }
    }
    var Count : Int{
        get{
            return count
        }
    }
    
    func Enqueue(_ value : T){
        let newCell  = QueueCell<T>(value: value)
        guard let _ = head, let tl = tail else {
            head = newCell
            tail = newCell
            count += 1
            return
        }
        tl.prev = newCell
        newCell.next = tl
        tail = newCell
        count += 1
    }
    
    func Dequeue() -> T?{
        guard let _ = head, let _ = tail else {
            return nil
        }
        let value = head?.value
        head = head?.prev
        head?.next = nil
        count -= 1
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


