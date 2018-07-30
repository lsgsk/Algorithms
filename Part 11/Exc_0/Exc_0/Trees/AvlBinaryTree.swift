import Cocoa

class AvlBinaryTree: CustomStringConvertible {
    private var root : AvlNode?
    
    //Add block
    func addNode(_ newValue: Int){
        addNode(&root, newValue)
    }
    
    private func addNode(_ node : inout AvlNode?, _ value: Int){
        if node == nil{
            node = AvlNode(value)
        }
        else{
            if value < node!.value{
                addNode(&node!.left, value)
            }else{
                addNode(&node!.right, value)
            }
        }
        node = balance(node!)
    }
    //Remove block
    func removeNode(_ target: Int){
        removeNode(&self.root, target)
    }
    
    private func removeNode(_ node : inout AvlNode?, _ target: Int){
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
                    var tparent : AvlNode? = nil
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
            removeNode(&node!.left, target)
        }else{
            removeNode(&node!.right, target)
        }
        if node != nil{
            node = balance(node!)
        }
    }
    //Balance block
    
    func rotateright(_ root : AvlNode) -> AvlNode{
        guard let newroot = root.left else {
            return root
        }
        root.left = newroot.right
        newroot.right = root
        return newroot
    }
    
    func rotateleft(_ root : AvlNode) -> AvlNode{
        guard let newroot = root.right else {
            return root
        }
        root.right = newroot.left;
        newroot.left = root;
        return newroot;
    }
    
    private func balance(_ node : AvlNode) -> AvlNode{
        if(node.bfactor == 2){
            if let factor = node.right?.bfactor, factor == -1 {
                node.right = rotateright(node.right!);
            }
            return rotateleft(node);
        }
        if(node.bfactor == -2){
            if let factor = node.left?.bfactor, factor == 1{
                node.left = rotateleft(node.left!);
            }
            return rotateright(node);
        }
        return node;
    }
    //othes
    var description: String{
        get{
            return root?.asString ?? "Empty tree"
        }
    }
    
    func traverseValuesInOrder() -> String{
        return traverseValuesInOrder(self.root).trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    private func traverseValuesInOrder(_ node: AvlNode?) -> String{
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
    private func traverseDepthInOrder(_ node: AvlNode?, _ depth: Int) -> String{
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




