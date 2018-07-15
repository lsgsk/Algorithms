

import Foundation

func TowerOfHanoi(from: ListStack<Int>, to : ListStack<Int>, other : ListStack<Int>, n: Int){
    if n > 1{
        TowerOfHanoi(from: from, to: other, other: to, n: n-1)
    }
    print("Step: from: \(from.dump()), to: \(to.dump()), other: \(other.dump())")
    if let top = from.pop(){
        to.push(item: top)
    }
    if n > 1 {
        TowerOfHanoi(from: other, to: to, other: from, n: n-1)
    }
}


print("Hello, World!")
var from = ListStack<Int>()
//from.push(item: 6)
//from.push(item: 5)
//from.push(item: 4)
from.push(item: 3)
from.push(item: 2)
from.push(item: 1)
var to = ListStack<Int>()
var other = ListStack<Int>()
print("From: \(from.dump()), to: \(to.dump())")
TowerOfHanoi(from: from, to: to, other: other, n: from.count)
print("From: \(from.dump()), to: \(to.dump())")

