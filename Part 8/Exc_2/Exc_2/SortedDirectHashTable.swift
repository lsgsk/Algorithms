//
//  BaseHashTable.swift
//  Exc_1
//
//  Created by Lsgsk on 14.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Cocoa

class SortedDirectHashTable: CustomStringConvertible {
    private var array : [HashCell?]
    init(count: Int = 10) {
        self.array = Array(repeating: nil, count: count)
    }
    
    func makeItems(){
        let values = [40,  1,  5, 20,  6, 11, 55, 12, 21, 26,
                      37, 50, 51,  7, 47, 85, 15, 19, 93, 25]
        for item in values{
            insert(item, "'\(String(item))'")
        }
    }
    
    func insert(_ key : Int, _ value: String){
        let index = key % array.count
        let newCell = HashCell(key, value)
        if let firstCell = array[index]{
            var carret : HashCell? = firstCell
            if firstCell.key > key{
                array[index] = newCell
                newCell.next = firstCell
                return
            }
            while let cell = carret?.next, key >= cell.key {
                carret = carret?.next
            }
            let temp = carret?.next
            carret?.next = newCell
            newCell.next = temp
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
        var listCounts = 0.0
        var totalLenght = 0.0
        for i in 0..<array.count{
            str += "[\(i)]: "
            var cell = array[i]
            var lengh = 0.0
            while let item = cell{
                lengh += 1.0
                str += "\(item.value) -> "
                cell = item.next
            }
            if lengh != 0.0{
                listCounts += 1.0
                totalLenght += lengh
            }
            str += "nil\n"
        }
        str += "Midle list lenght: \(Double(round(100*(totalLenght/listCounts))/100))"
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


