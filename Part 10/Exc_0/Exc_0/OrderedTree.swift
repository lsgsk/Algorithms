//
//  OrderedTree.swift
//  Exc_0
//
//  Created by Lsgsk on 24.07.2018.
//  Copyright © 2018 Lsgsk. All rights reserved.
//

import Cocoa

class OrderedTree : CustomStringConvertible {
    private var root : BinaryNode?
    init() {
    }
    
    func addNode(_ newValue: Int){
        if let root = self.root{
            addNode(root, newValue)
        }
        else{
            root = BinaryNode(newValue)
        }
    }
    
    private func addNode(_ root : BinaryNode, _ newValue: Int){
        if newValue < root.value{
            if let left = root.leftChild{
                addNode(left, newValue)
            }else{
                root.leftChild = BinaryNode(newValue)
            }
        }else{
            if let right = root.rightChild{
                addNode(right, newValue)
            }else{
                root.rightChild = BinaryNode(newValue)
            }
        }
    }
    func findNode(_ target: Int) -> BinaryNode?{
        return findNode(self.root, target)
    }
    
    private func findNode(_ root : BinaryNode?, _ target: Int) -> BinaryNode?{
        if let root = root{
            if target == root.value{
                return root
            }else if target < root.value{
                return findNode(root.leftChild, target)
            }else{
                return findNode(root.rightChild, target)
            }
        }
        else{
            return nil
        }
    }
    
    func removeNode(_ target: Int){
        removeNode(nil, self.root, target)
    }
    
    private func removeNode(_ parent : BinaryNode?, _ viewed : BinaryNode?, _ target: Int){
        if let viewed = viewed{
            if target == viewed.value{
                if viewed.leftChild == nil && viewed.rightChild == nil{
                    if parent == nil{
                        removeRoot()
                    } else{
                        removeTerminalLeaf(parent, viewed)
                    }
                } else if viewed.leftChild == nil || viewed.rightChild == nil{
                    if parent == nil{
                       removeRootOneChildLeaf(viewed)
                    } else{
                        removeOneChildLeaf(parent, viewed)
                    }
                }
                else{
                    if parent == nil{
                        
                    }else{
                        if viewed.leftChild?.rightChild == nil{
                            let viewedright = viewed.rightChild
                            if parent?.leftChild === viewed{
                                parent?.leftChild = viewed.leftChild
                            }else{
                                parent?.rightChild = viewed.leftChild
                            }
                            viewed.leftChild?.rightChild = viewedright
                        }else{
                            var tparemt : BinaryNode? = parent
                            var tviewed : BinaryNode? = viewed
                            while tviewed?.leftChild?.rightChild != nil{
                                tparemt = tviewed?.leftChild
                                tviewed = tviewed?.leftChild?.rightChild
                            }
                            tparemt?.rightChild = tviewed?.leftChild
                            let viewedleft = viewed.leftChild
                            let viewedright = viewed.rightChild
                            if parent?.leftChild === viewed{
                                parent?.leftChild = tviewed
                            }else{
                                parent?.rightChild = tviewed
                            }
                            tviewed?.rightChild = viewedright
                            tviewed?.leftChild = viewedleft
                        }
                    }
                }
            }else if target < viewed.value{
                return removeNode(viewed, viewed.leftChild, target)
            }else{
                return removeNode(viewed, viewed.rightChild, target)
            }
        }
    }
    private func removeRoot(){
        self.root = nil
    }
    
    private func removeTerminalLeaf(_ parent : BinaryNode?, _ viewed: BinaryNode?){
        if parent?.leftChild === viewed{
            parent?.leftChild = nil
        }else{
            parent?.rightChild = nil
        }
    }
    private func removeOneChildLeaf(_ parent : BinaryNode?, _ viewed: BinaryNode?){
        if parent?.leftChild === viewed{
            parent?.leftChild = viewed?.leftChild ?? viewed?.rightChild
        }else{
            parent?.rightChild = viewed?.leftChild ?? viewed?.rightChild
        }
    }
    
    private func removeRootOneChildLeaf(_ viewed: BinaryNode?){
        root = viewed?.leftChild ?? viewed?.rightChild
    }
    
    var description: String{
        get{
            var str = "Tree: "
            if let root = self.root{
                let children = ListQueue<BinaryNode>()
                children.Enqueue(root)
                while !children.isEmpty {
                    if let node = children.Dequeue(){
                        str +=  "\(node.value) "
                        if let left = node.leftChild{
                            children.Enqueue(left)
                        }
                        if let rigth = node.rightChild{
                            children.Enqueue(rigth)
                        }
                    }
                }
            }
            return str
        }
    }
    
    var treeStructure : String{
        get{
            var str = ""
            var levels: [[Int]] = []
            var level: [Int] = []
            let children = ListQueue<BinaryNode>()
            if let root = self.root{
                children.Enqueue(root)
                var levelCount = children.Count
                while !children.isEmpty {
                    if levelCount == 0{
                        levelCount = children.Count
                        str.append("\n")
                        levels.append(level)
                        level.removeAll()
                    }
                    if let node = children.Dequeue(){
                        str +=  "\(node.value) "
                        level.append(node.value)
                        if let left = node.leftChild{
                            children.Enqueue(left)
                        }
                        if let rigth = node.rightChild{
                            children.Enqueue(rigth)
                        }
                    }
                    levelCount -= 1
                }
            }
            levels.append(level)
            return str
        }
    }
    
}
