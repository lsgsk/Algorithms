import Cocoa

class OrderedBinaryTree : CustomStringConvertible {
    private var root : BinaryNode?
    init() {
    }
    
    func addNode(_ newValue: Int){
        addNode(&root, newValue)
    }
    
    private func addNode(_ node : inout BinaryNode?, _ value: Int){
        if node == nil{
            node = BinaryNode(value)
        }
        else{
            if value < node!.value{
                addNode(&node!.left, value)
            }else{
                addNode(&node!.right, value)
            }
        }
    }
    func findNode(_ target: Int) -> BinaryNode?{
        return findNode(self.root, target)
    }
    
    private func findNode(_ node : BinaryNode?, _ target: Int) -> BinaryNode?{
        if let root = node{
            if target == root.value{
                return root
            }else if target < root.value{
                return findNode(root.left, target)
            }else{
                return findNode(root.right, target)
            }
        }
        else{
            return nil
        }
    }
    
    func removeNode(_ target: Int){
        removeNode(&self.root, target)
    }
    
    private func removeNode(_ node : inout BinaryNode?, _ target: Int){
        if node == nil{
            return
        }
        else if target == node!.value{
            if node!.left == nil && node!.right == nil{
                node = nil
            }
            else if node!.left == nil || node!.right == nil{
                node = node!.left ?? node!.right
            }
            else{
                let pleft = node!.left
                let pright = node!.right
                if node!.left?.right == nil{
                    node = pleft
                    node?.right = pright
                }else{
                    var tparent : BinaryNode? = nil
                    var tpointer = node
                    while tpointer?.left?.right != nil{
                        tparent = tpointer?.left
                        tpointer = tpointer?.left?.right
                    }
                    tparent?.right = tpointer?.left
                    node = tpointer
                    node?.left = pleft
                    node?.right = pright
                }
            }
        }else if target < node!.value{
            return removeNode(&node!.left, target)
        }else{
            return removeNode(&node!.right, target)
        }
    }
    
    var description: String{
        get{
            return root?.asString ?? "Empty tree"
        }
    }
    
    func traverseValuesInOrder() -> String{
        return traverseValuesInOrder(self.root).trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    private func traverseValuesInOrder(_ node: BinaryNode?) -> String{
        var values = ""
        if let node = node{
            if let left = node.left{
                values += traverseValuesInOrder(left)
            }
            values += "\(node.value) "
            if let rigth = node.right{
                values += traverseValuesInOrder(rigth)
            }
        }
        return values
    }
    
    func traverseDepthInOrder() -> String{
        return traverseDepthInOrder(self.root, 0).trimmingCharacters(in: CharacterSet.whitespaces)
    }
    private func traverseDepthInOrder(_ node: BinaryNode?, _ depth: Int) -> String{
        var values = ""
        if let node = node{
            if let left = node.left{
                values += traverseDepthInOrder(left, depth+1)
            }
            values += "\(depth) "
            if let rigth = node.right{
                values += traverseDepthInOrder(rigth, depth+1)
            }
        }
        return values
    }
}

