//
//  TwiSideLinkedList.swift
//  Exc_0
//
//  Created by Lsgsk on 09.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Cocoa

class TwiSideLinkedList<T: Comparable>: CustomStringConvertible {
    private var top : ListCell<T>?
    
    func AddAtBeginning(_ value: T){
        let cell = ListCell<T>(value)
        cell.next = top
        top?.prev = cell
        top = cell
    }
    
    func insertAfter(after: T, value: T){
        var carriage = top
        while let item = carriage, item.value != after  {
            carriage = item.next
        }
        let cell = ListCell<T>(value)
        cell.next = carriage?.next
        cell.prev = carriage
        carriage?.next?.prev = cell
        carriage?.next = cell
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
        cell.prev = carriage
    }
    
    func deleteCell(value: T){
        var carriage = top
        while let item = carriage {
            if item.value == value{
                item.prev?.next = item.next
                item.next?.prev = item.prev
                if item.value == top?.value{
                    top = item.next
                }
                return
            }
            carriage = item.next
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
    var prev :ListCell<T>?
    init(_ value : T) {
        self.value = value
    }
}
