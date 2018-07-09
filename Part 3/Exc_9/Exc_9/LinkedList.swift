//
//  List.swift
//  Exc_0
//
//  Created by Lsgsk on 08.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Cocoa

class LinkedList<T: Comparable>: CustomStringConvertible {
    private var top : ListCell<T>?
    
    func AddAtBeginning(_ value: T){
        let cell = ListCell<T>(value)
        cell.next = top
        top = cell
    }
    
    func isListSorted() -> Bool{
        if var prev = top?.value{
            var carriage = top?.next
            while let item = carriage{
                if  item.value < prev{
                    return false
                }
                prev = item.value
                carriage = item.next
            }
        }
        return true
    }
    
    func AddAtEnd(_ value : T){
        let cell = ListCell<T>(value)
        guard var carriage = top else{
            top = cell
            return
        }
        while let item = carriage.next {
            carriage = item
        }
        carriage.next = cell
    }
    
    
    
    var count : Int{
        get{
            var length = 0;
            var cell = top
            while let _ = cell {
                length += 1
                cell = cell?.next
            }
            return length
        }
    }
    
    var description: String{
        var str = "List:"
        var carriage = top
        while let item = carriage {
            str += "\(item.value) "
            carriage = item.next
        }
        return str
    }
}
fileprivate class ListCell<T>{
    var value : T
    var next :ListCell<T>?
    init(_ value : T) {
        self.value = value
    }
}
