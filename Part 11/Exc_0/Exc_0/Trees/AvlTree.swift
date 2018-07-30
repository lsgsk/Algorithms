import Cocoa

class AvlTree: CustomStringConvertible {
    private var root : AvlNode?
    
    //Add block
    func addNode(_ value: Int){
        if root != nil{
            addNode(&root!, value) //важна именно родительская рутовая ссылка
        } else{
            root = AvlNode(value)
        }
    }
    private func addNode(_ node : inout AvlNode, _ value: Int){
        if value < node.value{
            if node.left != nil{
                addNode(&node.left!, value)
            }else{
                node.left = AvlNode(value)
            }
        }else{
            if node.right != nil{
                addNode(&node.right!, value)
            }else{
                node.right = AvlNode(value)
            }
        }
        node = balance(node)
    }
    
    //find block
    func findNode(_ target: Int) -> AvlNode?{
        return findNode(self.root, target)
    }
    private func findNode(_ root : AvlNode?, _ target: Int) -> AvlNode?{
        if let root = root{
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
    //Remove block
    
    
    
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
    
    var description: String{
        get{
            return root?.asString ?? "Empty tree"
        }
    }
}




