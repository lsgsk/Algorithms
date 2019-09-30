//
//  CloseTree.swift
//  Exc_0
//
//  Created by Lsgsk on 25.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Cocoa

class ThreadedTree: NSObject {
    private var root : ThreadedNode?
    
    func addNode(_ newValue: Int){
        if let root = self.root{
            addNode(root, newValue)
        } else{
            root = ThreadedNode(newValue)
        }
    }
    
    private func addNode(_ subroot : ThreadedNode, _ newValue: Int){
        if newValue < subroot.value{
            if let left = subroot.leftChild{
                addNode(left, newValue)
            }else{
                let child = ThreadedNode(newValue)
                child.leftThread = subroot.leftThread
                child.rightThread = subroot
                subroot.leftChild = child
                subroot.leftThread = nil
            }
        }else{
            if let right = subroot.rightChild{
                addNode(right, newValue)
            }else{
                let child = ThreadedNode(newValue)
                child.leftThread = subroot
                child.rightThread = subroot.rightThread
                subroot.rightChild = child
                subroot.rightThread = nil
            }
        }
    }
    
    func InorderWithThreads(){
        var node = self.root
        var via_branch = true
        while node != nil {
            if via_branch{
                while node?.leftChild != nil{
                    node = node?.leftChild
                }
            }
            if let value = node?.value{
                print(value,terminator:" ")
            }
            if node?.rightChild == nil{
                node = node?.rightThread
                via_branch = false
            }else{
                node = node?.rightChild
                via_branch = true
            }
        }
        print("")
    }
    
    func DisorderWithThreads(){
        var node = self.root
        var via_branch = true
        while node != nil {
            if via_branch{
                while node?.rightChild != nil{
                    node = node?.rightChild
                }
            }
            if let value = node?.value{
                print(value,terminator:" ")
            }
            if node?.leftChild == nil{
                node = node?.leftThread
                via_branch = false
            }else{
                node = node?.leftChild
                via_branch = true
            }
        }
        print("")
    }
}

class ThreadedNode{
    var value: Int
    var leftThread: ThreadedNode?
    var rightThread: ThreadedNode?
    var leftChild: ThreadedNode?
    var rightChild: ThreadedNode?
    init(_ value: Int) {
        self.value = value
    }
}
