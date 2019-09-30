//
//  BaseHashTable.swift
//  Exc_1
//
//  Created by Lsgsk on 14.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Cocoa

class DirectHashTable: CustomStringConvertible {
    private var array : [HashCell?]
    init(count: Int = 10) {
        self.array = Array(repeating: nil, count: count)
    }
    
    func makeItems(){
        let values = [ 40 , 1, 5, 20, 6, 11, 55, 12, 21, 26, 37, 50, 51, 7, 47, 88, 15, 19, 93]
        for value in values{
            insert(value, String(value))
        }
    }
    
    func insert(_ key : Int, _ value: String){
        let index = key % array.count
        let newCell = HashCell(key, value)
        if let firstCell = array[index]{
            var carret : HashCell? = firstCell
            while let _ = carret?.next{
                carret = carret?.next
            }
            carret?.next = newCell
        }else{
            array[index] = newCell
        }
    }
    
    func find(_ key : Int) -> String?{
        let index = key % array.count
        var carret : HashCell? = array[index]
        while let item = carret{
            if item.key == key{
                return item.value
            }
            carret = carret?.next
        }
        return nil
    }
    
    var description: String{
        var str = "Hashtable: \n"
        for i in 0..<array.count{
            str += "[\(i)]: "
            var cell = array[i]
            while let item = cell{
                str += "\(item.value) -> "
                cell = item.next
            }
                str += "nil\n"
        }
        return str
    }
}

fileprivate class HashCell{
    let key : Int
    let value : String
    var next: HashCell?
    init(_ key : Int, _ value: String) {
        self.key = key
        self.value = value
    }
}


