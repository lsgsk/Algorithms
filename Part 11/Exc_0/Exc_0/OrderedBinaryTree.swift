import Cocoa

class OrderedBinaryTree : CustomStringConvertible {
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
                        if root?.leftChild?.rightChild == nil{
                            let viewedright = root?.rightChild
                            root = viewed.leftChild
                            root?.rightChild = viewedright
                        }else{
                            //!!!!
                            var tparemt : BinaryNode? = root
                            var tviewed : BinaryNode? = root
                            while tviewed?.leftChild?.rightChild != nil{
                                tparemt = tviewed?.leftChild
                                tviewed = tviewed?.leftChild?.rightChild
                            }
                            let viewedleft = root?.leftChild
                            let viewedright = root?.rightChild
                            tparemt?.rightChild = tviewed?.leftChild
                            root = tviewed
                            root?.leftChild = viewedleft
                            root?.rightChild = viewedright
                        }
                        
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
            return root?.asString ?? "Empty tree"
        }
    }
    
    func traverseValuesInOrder() -> String{
        return traverseValuesInOrder(self.root).trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    func traverseValuesInOrder(_ node: BinaryNode?) -> String{
        var values = ""
        if let node = node{
            if let left = node.leftChild{
               values += traverseValuesInOrder(left)
            }
            values += "\(node.value) "
            if let rigth = node.rightChild{
                values += traverseValuesInOrder(rigth)
            }
        }
        return values
    }
    
    func traverseDepthInOrder() -> String{
        return traverseDepthInOrder(self.root, 0).trimmingCharacters(in: CharacterSet.whitespaces)
    }
    func traverseDepthInOrder(_ node: BinaryNode?, _ depth: Int) -> String{
        var values = ""
        if let node = node{
            if let left = node.leftChild{
                values += traverseDepthInOrder(left, depth+1)
            }
            values += "\(depth) "
            if let rigth = node.rightChild{
                values += traverseDepthInOrder(rigth, depth+1)
            }
        }
        return values
    }
}

