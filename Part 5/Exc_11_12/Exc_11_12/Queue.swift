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
    
    func insertionSort(){
        

    }
    
    var count : Int{
        get{
            var count = 0
            var curret = head
            while let item = curret {
                count += 1
                curret = item.prev
            }
            return count
        }
    }
    
    func selectionSort(){
        let tempQuery = ListQueue<T>()
        var notSortedCarret = head
        while let notSortedHead = notSortedCarret {
            print(self)
            var maximum = notSortedHead
            var smcarret = notSortedCarret
            while let item = smcarret{
                if maximum.value < item.value{
                    maximum = item
                }
                smcarret = smcarret?.prev
            }
            print(maximum.value)
            
            maximum.next?.prev = maximum.prev
            maximum.prev?.next = maximum.next
            if maximum.next == nil{
                notSortedCarret = notSortedCarret?.prev
                head = notSortedCarret
            }
            tempQuery.Enqueue(value: maximum.value)
        }
        self.head = tempQuery.head
    }
    
    fileprivate class QueueCell<T>{
        init(value:T) {
            self.value = value
        }
        let value : T
        var next : QueueCell<T>?
        var prev : QueueCell<T>?
        
    }
}



