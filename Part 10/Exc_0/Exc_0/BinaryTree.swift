//
//  BinaryTree.swift
//  Exc_0
//
//  Created by Lsgsk on 24.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Cocoa

func traversePreorder(_ node: BinaryNode){
    print(node.value,terminator:" ")
    if let left = node.leftChild{
        traversePreorder(left)
    }
    if let rigth = node.rightChild{
        traversePreorder(rigth)
    }
}
func traverseInorder(_ node: BinaryNode){    
    if let left = node.leftChild{
        traverseInorder(left)
    }
    print(node.value,terminator:" ")
    if let rigth = node.rightChild{
        traverseInorder(rigth)
    }
}
func traversePostorder(_ node: BinaryNode){
    if let left = node.leftChild{
        traversePostorder(left)
    }
    if let rigth = node.rightChild{
        traversePostorder(rigth)
    }
    print(node.value,terminator:" ")
}

func traverseDepthFirst(_ root: BinaryNode){
    let children = ListQueue<BinaryNode>()
    children.Enqueue(root)
    while !children.isEmpty {
        if let node = children.Dequeue(){
            print(node.value,terminator:" ")
            if let left = node.leftChild{
                children.Enqueue(left)
            }
            if let rigth = node.rightChild{
                  children.Enqueue(rigth)
            }
        }
       
    }
}


class BinaryNode : CustomStringConvertible{
    var description: String{
        return "BinaryNode. Value:\(value)"
    }
    
    var value : Int
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    init(_ value: Int) {
        self.value = value
    }
}
