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
    
    func insertAfter(after: T, value: T){
        var carriage = top
        while let item = carriage, item.value != after  {
            carriage = item.next
        }
        let cell = ListCell<T>(value)
        cell.next = carriage?.next
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
    }
    
    fileprivate func findCell(value: T, cell: ListCell<T>?) -> ListCell<T>?{
        guard  let cell = cell else { return nil }
        if cell.value == value{
            return cell
        }else{
            return findCell(value: value, cell: cell.next)
        }
    }
    
    func deleteCell(value: T){
        if value == top?.value{
            top = top?.next
            return
        }
        var carriage = top
        while let item = carriage?.next, item.value != value  {
            carriage = item
        }
        carriage?.next = carriage?.next?.next
    }
    
    func copyList() -> LinkedList<T>{
        let list = LinkedList<T>()
        var carriage = top
        while let item = carriage {
            list.AddAtEnd(item.value)
            carriage = item.next
        }
        return list
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
    
    func Insertionsort(){
    
    }
    
    func selectionSort(){
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
